/*
 * malloc.c
 *
 * Very simple linked-list based malloc()/free().
 */

#include <stdlib.h>
#include "init.h"
#include "malloc.h"

struct free_arena_header __malloc_head =
{
  {
    ARENA_TYPE_HEAD,
    0,
    &__malloc_head,
    &__malloc_head,
  },
  &__malloc_head,
  &__malloc_head
};

/* This is extern so it can be overridden by the user application */
extern size_t __stack_size;
extern void *__mem_end;		/* Produced after argv parsing */

static inline size_t sp(void)
{
  size_t sp;
  asm volatile("movl %%esp,%0" : "=rm" (sp));
  return sp;
}

static void __constructor init_memory_arena(void)
{
  struct free_arena_header *fp;
  size_t start, total_space;

  start = (size_t)ARENA_ALIGN_UP(__mem_end);
  total_space = sp() - start;

  if ( __stack_size == 0 || __stack_size > total_space >> 1 )
    __stack_size = total_space >> 1; /* Half for the stack, half for the heap... */
  
  if ( total_space < __stack_size + 4*sizeof(struct arena_header) )
    __stack_size = total_space - 4*sizeof(struct arena_header);

  fp = (struct free_arena_header *)start;
  fp->a.type = ARENA_TYPE_FREE;
  fp->a.size = total_space - __stack_size;
  
  /* Insert into chains */
  fp->a.next = fp->a.prev = &__malloc_head;
  fp->next_free = fp->prev_free = &__malloc_head;
  __malloc_head.a.next = __malloc_head.a.prev = fp;
  __malloc_head.next_free = __malloc_head.prev_free = fp;
}

static void *__malloc_from_block(struct free_arena_header *fp, size_t size)
{
  size_t fsize;
  struct free_arena_header *nfp, *na;

  fsize = fp->a.size;
  
  /* We need the 2* to account for the larger requirements of a free block */
  if ( fsize >= size+2*sizeof(struct arena_header) ) {
    /* Bigger block than required -- split block */
    nfp = (struct free_arena_header *)((char *)fp + size);
    na = fp->a.next;

    nfp->a.type = ARENA_TYPE_FREE;
    nfp->a.size = fsize-size;
    fp->a.type  = ARENA_TYPE_USED;
    fp->a.size  = size;

    /* Insert into all-block chain */
    nfp->a.prev = fp;
    nfp->a.next = na;
    na->a.prev = nfp;
    fp->a.next = nfp;
    
    /* Replace current block on free chain */
    nfp->next_free = fp->next_free;
    nfp->prev_free = fp->prev_free;
    fp->next_free->prev_free = nfp;
    fp->prev_free->next_free = nfp;
  } else {
    /* Allocate the whole block */
    fp->a.type = ARENA_TYPE_USED;

    /* Remove from free chain */
    fp->next_free->prev_free = fp->prev_free;
    fp->prev_free->next_free = fp->next_free;
  }
  
  return (void *)(&fp->a + 1);
}

void *malloc(size_t size)
{
  struct free_arena_header *fp;

  if ( size == 0 )
    return NULL;

  /* Add the obligatory arena header, and round up */
  size = (size+2*sizeof(struct arena_header)-1) & ~ARENA_SIZE_MASK;

  for ( fp = __malloc_head.next_free ; fp->a.type != ARENA_TYPE_HEAD ;
	fp = fp->next_free ) {
    if ( fp->a.size >= size ) {
      /* Found fit -- allocate out of this block */
      return __malloc_from_block(fp, size);
    }
  }

  /* Nothing found... need to request a block from the kernel */
  return NULL;			/* No kernel to get stuff from */
}
