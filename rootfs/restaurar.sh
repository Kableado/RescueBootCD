#!/bin/sh

mount_cd () 
{
    for i in /dev/cdroms/*; 
    do
	if mount -t iso9660 $i /mnt/cdrom; 
	then
    	    if test -f /mnt/cdrom/bootcd
	    then
		#umount $i
        	DEVICE=$i
		return 0
	    else
		umount $i
    	    fi
	fi
    done
    return 1
}


# Buscar el cdrom
echo "Buscar el cdrom"
mount_cd
retval=$?

if test $retval -eq 0 ; then
  # restaurar
  echo "Restaurar."
  partimage -b restore /dev/scsi/host0/bus0/target0/lun0/part1 /mnt/cdrom/winxp.000
  partimage -b restmbr /mnt/cdrom/winxp.000

  # desmontar 
  umount /mnt/cdrom
else
  echo "No se encuentra el CD"
fi


