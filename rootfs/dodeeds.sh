#!/bin/sh



# preguntar que se desea hacer
dialog --clear --title "Disco Recuperacion." \
	--menu "Selecciona la accion a realizar." 20 51 4 \
	"1" "Restaurar particion." \
	"2" "Consola." \
	"3" "Salir." 2> /tmpf

retval=$?



case $retval in
  0)
    echo "`cat /tmpf` elegido."
    if test "`cat /tmpf`" = "1" ; then
      echo "restaurar"
      /restaurar.sh
    fi
    if test "`cat /tmpf`" = "2" ; then
      echo "Consola"
      /bin/sh
    fi
    ;;
  1)
    echo "Salida";;
  255)
    if test -s /tmpf ; then
      cat /tmpf
    else
      echo "Salida"
    fi
    ;;
esac

# reiniciar
/sbin/reboot
