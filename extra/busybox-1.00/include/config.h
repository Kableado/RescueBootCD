/*
 * Automatically generated header file: don't edit
 */

#define AUTOCONF_INCLUDED

/* Version Number */
#define BB_VER "1.00"
#define BB_BT "2005.08.13-21:20+0000"

#define HAVE_DOT_CONFIG 1

/*
 * General Configuration
 */
#define CONFIG_FEATURE_BUFFERS_USE_MALLOC 1
#undef CONFIG_FEATURE_BUFFERS_GO_ON_STACK
#undef CONFIG_FEATURE_BUFFERS_GO_IN_BSS
#define CONFIG_FEATURE_VERBOSE_USAGE 1
#undef CONFIG_FEATURE_INSTALLER
#undef CONFIG_LOCALE_SUPPORT
#define CONFIG_FEATURE_DEVFS 1
#define CONFIG_FEATURE_DEVPTS 1
#define CONFIG_FEATURE_CLEAN_UP 1
#define CONFIG_FEATURE_SUID 1
#undef CONFIG_FEATURE_SUID_CONFIG
#undef CONFIG_SELINUX

/*
 * Build Options
 */
#define CONFIG_STATIC 1
#define CONFIG_LFS 1
#undef USING_CROSS_COMPILER
#define EXTRA_CFLAGS_OPTIONS ""

/*
 * Installation Options
 */
#undef CONFIG_INSTALL_NO_USR
#define PREFIX "./_install"

/*
 * Archival Utilities
 */
#define CONFIG_AR 1
#undef CONFIG_FEATURE_AR_LONG_FILENAMES
#define CONFIG_BUNZIP2 1
#define CONFIG_CPIO 1
#undef CONFIG_DPKG
#undef CONFIG_DPKG_DEB
#define CONFIG_GUNZIP 1
#define CONFIG_FEATURE_GUNZIP_UNCOMPRESS 1
#define CONFIG_GZIP 1
#undef CONFIG_RPM2CPIO
#undef CONFIG_RPM
#define CONFIG_TAR 1
#define CONFIG_FEATURE_TAR_CREATE 1
#define CONFIG_FEATURE_TAR_BZIP2 1
#define CONFIG_FEATURE_TAR_FROM 1
#define CONFIG_FEATURE_TAR_GZIP 1
#define CONFIG_FEATURE_TAR_COMPRESS 1
#define CONFIG_FEATURE_TAR_OLDGNU_COMPATABILITY 1
#define CONFIG_FEATURE_TAR_GNU_EXTENSIONS 1
#define CONFIG_FEATURE_TAR_LONG_OPTIONS 1
#define CONFIG_UNCOMPRESS 1
#define CONFIG_UNZIP 1

/*
 * Common options for cpio and tar
 */
#undef CONFIG_FEATURE_UNARCHIVE_TAPE

/*
 * Coreutils
 */
#define CONFIG_BASENAME 1
#undef CONFIG_CAL
#define CONFIG_CAT 1
#define CONFIG_CHGRP 1
#define CONFIG_CHMOD 1
#define CONFIG_CHOWN 1
#define CONFIG_CHROOT 1
#define CONFIG_CMP 1
#define CONFIG_CP 1
#define CONFIG_CUT 1
#define CONFIG_DATE 1
#define CONFIG_FEATURE_DATE_ISOFMT 1
#define CONFIG_DD 1
#define CONFIG_DF 1
#define CONFIG_DIRNAME 1
#define CONFIG_DOS2UNIX 1
#define CONFIG_UNIX2DOS 1
#define CONFIG_DU 1
#define CONFIG_FEATURE_DU_DEFALT_BLOCKSIZE_1K 1
#define CONFIG_ECHO 1
#define CONFIG_FEATURE_FANCY_ECHO 1
#define CONFIG_ENV 1
#define CONFIG_EXPR 1
#define CONFIG_FALSE 1
#define CONFIG_FOLD 1
#define CONFIG_HEAD 1
#define CONFIG_FEATURE_FANCY_HEAD 1
#define CONFIG_HOSTID 1
#define CONFIG_ID 1
#define CONFIG_INSTALL 1
#define CONFIG_LENGTH 1
#define CONFIG_LN 1
#define CONFIG_LOGNAME 1
#define CONFIG_LS 1
#define CONFIG_FEATURE_LS_FILETYPES 1
#define CONFIG_FEATURE_LS_FOLLOWLINKS 1
#define CONFIG_FEATURE_LS_RECURSIVE 1
#define CONFIG_FEATURE_LS_SORTFILES 1
#define CONFIG_FEATURE_LS_TIMESTAMPS 1
#define CONFIG_FEATURE_LS_USERNAME 1
#define CONFIG_FEATURE_LS_COLOR 1
#define CONFIG_MD5SUM 1
#define CONFIG_MKDIR 1
#define CONFIG_MKFIFO 1
#define CONFIG_MKNOD 1
#define CONFIG_MV 1
#define CONFIG_OD 1
#define CONFIG_PRINTF 1
#define CONFIG_PWD 1
#define CONFIG_REALPATH 1
#define CONFIG_RM 1
#define CONFIG_RMDIR 1
#define CONFIG_SEQ 1
#define CONFIG_SHA1SUM 1
#define CONFIG_SLEEP 1
#define CONFIG_FEATURE_FANCY_SLEEP 1
#define CONFIG_SORT 1
#define CONFIG_STTY 1
#define CONFIG_SYNC 1
#define CONFIG_TAIL 1
#define CONFIG_FEATURE_FANCY_TAIL 1
#define CONFIG_TEE 1
#define CONFIG_FEATURE_TEE_USE_BLOCK_IO 1
#define CONFIG_TEST 1

/*
 * test (forced enabled for use with shell)
 */
#define CONFIG_FEATURE_TEST_64 1
#define CONFIG_TOUCH 1
#define CONFIG_TR 1
#define CONFIG_TRUE 1
#define CONFIG_TTY 1
#define CONFIG_UNAME 1
#define CONFIG_UNIQ 1
#define CONFIG_USLEEP 1
#undef CONFIG_UUDECODE
#undef CONFIG_UUENCODE
#undef CONFIG_WATCH
#define CONFIG_WC 1
#define CONFIG_WHO 1
#define CONFIG_WHOAMI 1
#define CONFIG_YES 1

/*
 * Common options for cp and mv
 */
#define CONFIG_FEATURE_PRESERVE_HARDLINKS 1

/*
 * Common options for ls and more
 */
#define CONFIG_FEATURE_AUTOWIDTH 1

/*
 * Common options for df, du, ls
 */
#define CONFIG_FEATURE_HUMAN_READABLE 1

/*
 * Common options for md5sum, sha1sum
 */
#define CONFIG_FEATURE_MD5_SHA1_SUM_CHECK 1

/*
 * Console Utilities
 */
#define CONFIG_CHVT 1
#define CONFIG_CLEAR 1
#define CONFIG_DEALLOCVT 1
#define CONFIG_DUMPKMAP 1
#define CONFIG_LOADFONT 1
#define CONFIG_LOADKMAP 1
#define CONFIG_OPENVT 1
#define CONFIG_RESET 1
#define CONFIG_SETKEYCODES 1

/*
 * Debian Utilities
 */
#define CONFIG_MKTEMP 1
#undef CONFIG_PIPE_PROGRESS
#define CONFIG_READLINK 1
#undef CONFIG_RUN_PARTS
#undef CONFIG_START_STOP_DAEMON
#define CONFIG_WHICH 1

/*
 * Editors
 */
#define CONFIG_AWK 1
#define CONFIG_FEATURE_AWK_MATH 1
#define CONFIG_PATCH 1
#define CONFIG_SED 1
#define CONFIG_VI 1
#define CONFIG_FEATURE_VI_COLON 1
#define CONFIG_FEATURE_VI_YANKMARK 1
#define CONFIG_FEATURE_VI_SEARCH 1
#define CONFIG_FEATURE_VI_USE_SIGNALS 1
#define CONFIG_FEATURE_VI_DOT_CMD 1
#define CONFIG_FEATURE_VI_READONLY 1
#define CONFIG_FEATURE_VI_SETOPTS 1
#define CONFIG_FEATURE_VI_SET 1
#define CONFIG_FEATURE_VI_WIN_RESIZE 1
#define CONFIG_FEATURE_VI_OPTIMIZE_CURSOR 1

/*
 * Finding Utilities
 */
#define CONFIG_FIND 1
#define CONFIG_FEATURE_FIND_MTIME 1
#define CONFIG_FEATURE_FIND_PERM 1
#define CONFIG_FEATURE_FIND_TYPE 1
#define CONFIG_FEATURE_FIND_XDEV 1
#define CONFIG_FEATURE_FIND_NEWER 1
#define CONFIG_FEATURE_FIND_INUM 1
#define CONFIG_GREP 1
#define CONFIG_FEATURE_GREP_EGREP_ALIAS 1
#define CONFIG_FEATURE_GREP_FGREP_ALIAS 1
#define CONFIG_FEATURE_GREP_CONTEXT 1
#define CONFIG_XARGS 1
#define CONFIG_FEATURE_XARGS_SUPPORT_CONFIRMATION 1
#define CONFIG_FEATURE_XARGS_SUPPORT_QUOTES 1
#define CONFIG_FEATURE_XARGS_SUPPORT_TERMOPT 1
#define CONFIG_FEATURE_XARGS_SUPPORT_ZERO_TERM 1

/*
 * Init Utilities
 */
#define CONFIG_INIT 1
#define CONFIG_FEATURE_USE_INITTAB 1
#define CONFIG_FEATURE_INITRD 1
#undef CONFIG_FEATURE_INIT_COREDUMPS
#undef CONFIG_FEATURE_EXTRA_QUIET
#define CONFIG_HALT 1
#define CONFIG_POWEROFF 1
#define CONFIG_REBOOT 1
#define CONFIG_MESG 1

/*
 * Login/Password Management Utilities
 */
#define CONFIG_USE_BB_PWD_GRP 1
#define CONFIG_ADDGROUP 1
#define CONFIG_DELGROUP 1
#define CONFIG_ADDUSER 1
#define CONFIG_DELUSER 1
#define CONFIG_GETTY 1
#define CONFIG_FEATURE_U_W_TMP 1
#define CONFIG_LOGIN 1
#define CONFIG_FEATURE_SECURETTY 1
#define CONFIG_PASSWD 1
#define CONFIG_SU 1
#define CONFIG_SULOGIN 1
#define CONFIG_VLOCK 1

/*
 * Common options for adduser, deluser, login, su
 */
#define CONFIG_FEATURE_SHADOWPASSWDS 1
#undef CONFIG_USE_BB_SHADOW

/*
 * Miscellaneous Utilities
 */
#define CONFIG_ADJTIMEX 1
#undef CONFIG_CROND
#undef CONFIG_CRONTAB
#define CONFIG_DC 1
#define CONFIG_DEVFSD 1
#define CONFIG_DEVFSD_MODLOAD 1
#define CONFIG_DEVFSD_FG_NP 1
#define CONFIG_DEVFSD_VERBOSE 1
#define CONFIG_LAST 1
#define CONFIG_HDPARM 1
#define CONFIG_FEATURE_HDPARM_GET_IDENTITY 1
#undef CONFIG_FEATURE_HDPARM_HDIO_SCAN_HWIF
#undef CONFIG_FEATURE_HDPARM_HDIO_UNREGISTER_HWIF
#undef CONFIG_FEATURE_HDPARM_HDIO_DRIVE_RESET
#undef CONFIG_FEATURE_HDPARM_HDIO_TRISTATE_HWIF
#define CONFIG_FEATURE_HDPARM_HDIO_GETSET_DMA 1
#define CONFIG_MAKEDEVS 1
#define CONFIG_MT 1
#define CONFIG_RX 1
#define CONFIG_STRINGS 1
#define CONFIG_TIME 1
#define CONFIG_WATCHDOG 1

/*
 * Linux Module Utilities
 */
#define CONFIG_INSMOD 1
#define CONFIG_FEATURE_2_4_MODULES 1
#define CONFIG_FEATURE_2_6_MODULES 1
#undef CONFIG_FEATURE_INSMOD_VERSION_CHECKING
#undef CONFIG_FEATURE_INSMOD_KSYMOOPS_SYMBOLS
#undef CONFIG_FEATURE_INSMOD_LOADINKMEM
#undef CONFIG_FEATURE_INSMOD_LOAD_MAP
#define CONFIG_LSMOD 1
#define CONFIG_MODPROBE 1
#define CONFIG_RMMOD 1
#define CONFIG_FEATURE_CHECK_TAINTED_MODULE 1

/*
 * Networking Utilities
 */
#undef CONFIG_FEATURE_IPV6
#define CONFIG_ARPING 1
#define CONFIG_FTPGET 1
#define CONFIG_FTPPUT 1
#define CONFIG_HOSTNAME 1
#undef CONFIG_HTTPD
#define CONFIG_IFCONFIG 1
#define CONFIG_FEATURE_IFCONFIG_STATUS 1
#undef CONFIG_FEATURE_IFCONFIG_SLIP
#define CONFIG_FEATURE_IFCONFIG_MEMSTART_IOADDR_IRQ 1
#define CONFIG_FEATURE_IFCONFIG_HW 1
#define CONFIG_FEATURE_IFCONFIG_BROADCAST_PLUS 1
#undef CONFIG_IFUPDOWN
#undef CONFIG_INETD
#define CONFIG_IP 1
#define CONFIG_FEATURE_IP_ADDRESS 1

/*
 *   address (forced enabled for ipaddr)
 */
#define CONFIG_FEATURE_IP_LINK 1

/*
 *   link (forced enabled for iplink)
 */
#define CONFIG_FEATURE_IP_ROUTE 1

/*
 *   route (forced enabled for iproute)
 */
#define CONFIG_FEATURE_IP_TUNNEL 1

/*
 *   tunnel (forced enabled for iptunnel)
 */
#define CONFIG_IPCALC 1
#define CONFIG_FEATURE_IPCALC_FANCY 1
#define CONFIG_IPADDR 1
#define CONFIG_IPLINK 1
#define CONFIG_IPROUTE 1
#define CONFIG_IPTUNNEL 1
#define CONFIG_NAMEIF 1
#define CONFIG_NC 1
#define CONFIG_NETSTAT 1
#define CONFIG_NSLOOKUP 1
#define CONFIG_PING 1
#define CONFIG_FEATURE_FANCY_PING 1
#define CONFIG_ROUTE 1
#define CONFIG_TELNET 1
#define CONFIG_FEATURE_TELNET_TTYPE 1
#define CONFIG_FEATURE_TELNET_AUTOLOGIN 1
#undef CONFIG_TELNETD
#undef CONFIG_TFTP
#define CONFIG_TRACEROUTE 1
#define CONFIG_FEATURE_TRACEROUTE_VERBOSE 1
#undef CONFIG_VCONFIG
#define CONFIG_WGET 1
#define CONFIG_FEATURE_WGET_STATUSBAR 1
#define CONFIG_FEATURE_WGET_AUTHENTICATION 1
#undef CONFIG_FEATURE_WGET_IP6_LITERAL

/*
 * udhcp Server/Client
 */
#define CONFIG_UDHCPD 1
#define CONFIG_UDHCPC 1
#undef CONFIG_DUMPLEASES
#undef CONFIG_FEATURE_UDHCP_SYSLOG
#undef CONFIG_FEATURE_UDHCP_DEBUG

/*
 * Process Utilities
 */
#define CONFIG_FREE 1
#define CONFIG_KILL 1
#define CONFIG_KILLALL 1
#define CONFIG_PIDOF 1
#define CONFIG_PS 1
#define CONFIG_RENICE 1
#define CONFIG_TOP 1
#define FEATURE_CPU_USAGE_PERCENTAGE 1
#define CONFIG_UPTIME 1
#define CONFIG_SYSCTL 1

/*
 * Another Bourne-like Shell
 */
#define CONFIG_FEATURE_SH_IS_ASH 1
#undef CONFIG_FEATURE_SH_IS_HUSH
#undef CONFIG_FEATURE_SH_IS_LASH
#undef CONFIG_FEATURE_SH_IS_MSH
#undef CONFIG_FEATURE_SH_IS_NONE
#define CONFIG_ASH 1

/*
 * Ash Shell Options
 */
#define CONFIG_ASH_JOB_CONTROL 1
#define CONFIG_ASH_ALIAS 1
#define CONFIG_ASH_MATH_SUPPORT 1
#define CONFIG_ASH_MATH_SUPPORT_64 1
#undef CONFIG_ASH_GETOPTS
#undef CONFIG_ASH_CMDCMD
#undef CONFIG_ASH_MAIL
#define CONFIG_ASH_OPTIMIZE_FOR_SIZE 1
#define CONFIG_ASH_RANDOM_SUPPORT 1
#undef CONFIG_HUSH
#undef CONFIG_LASH
#undef CONFIG_MSH

/*
 * Bourne Shell Options
 */
#define CONFIG_FEATURE_SH_EXTRA_QUIET 1
#undef CONFIG_FEATURE_SH_STANDALONE_SHELL
#define CONFIG_FEATURE_COMMAND_EDITING 1
#define CONFIG_FEATURE_COMMAND_HISTORY 15
#define CONFIG_FEATURE_COMMAND_SAVEHISTORY 1
#define CONFIG_FEATURE_COMMAND_TAB_COMPLETION 1
#undef CONFIG_FEATURE_COMMAND_USERNAME_COMPLETION
#define CONFIG_FEATURE_SH_FANCY_PROMPT 1

/*
 * System Logging Utilities
 */
#define CONFIG_SYSLOGD 1
#define CONFIG_FEATURE_ROTATE_LOGFILE 1
#undef CONFIG_FEATURE_REMOTE_LOG
#undef CONFIG_FEATURE_IPC_SYSLOG
#define CONFIG_KLOGD 1
#define CONFIG_LOGGER 1

/*
 * Linux System Utilities
 */
#define CONFIG_DMESG 1
#define CONFIG_FBSET 1
#define CONFIG_FEATURE_FBSET_FANCY 1
#define CONFIG_FEATURE_FBSET_READMODE 1
#define CONFIG_FDFLUSH 1
#define CONFIG_FDFORMAT 1
#define CONFIG_FDISK 1
#define FDISK_SUPPORT_LARGE_DISKS 1
#define CONFIG_FEATURE_FDISK_WRITABLE 1
#undef CONFIG_FEATURE_AIX_LABEL
#undef CONFIG_FEATURE_SGI_LABEL
#undef CONFIG_FEATURE_SUN_LABEL
#undef CONFIG_FEATURE_OSF_LABEL
#define CONFIG_FEATURE_FDISK_ADVANCED 1
#define CONFIG_FREERAMDISK 1
#define CONFIG_FSCK_MINIX 1
#define CONFIG_MKFS_MINIX 1

/*
 * Minix filesystem support
 */
#define CONFIG_FEATURE_MINIX2 1
#undef CONFIG_GETOPT
#define CONFIG_HEXDUMP 1
#define CONFIG_HWCLOCK 1
#define CONFIG_FEATURE_HWCLOCK_LONGOPTIONS 1
#define CONFIG_LOSETUP 1
#define CONFIG_MKSWAP 1
#define CONFIG_MORE 1
#define CONFIG_FEATURE_USE_TERMIOS 1
#define CONFIG_PIVOT_ROOT 1
#define CONFIG_RDATE 1
#define CONFIG_SWAPONOFF 1
#define CONFIG_MOUNT 1
#define CONFIG_NFSMOUNT 1
#define CONFIG_UMOUNT 1
#define CONFIG_FEATURE_MOUNT_FORCE 1

/*
 * Common options for mount/umount
 */
#define CONFIG_FEATURE_MOUNT_LOOP 1
#define CONFIG_FEATURE_MTAB_SUPPORT 1
#define CONFIG_FEATURE_MTAB_FILENAME "/etc/mtab"

/*
 * Debugging Options
 */
#undef CONFIG_DEBUG
