#!/bin/sh
#
# Manage TI SGX PVR drivers

case "$1" in
    start)
        echo "Loading PVR drivers"
        modprobe pvrsrvkm
        /usr/sbin/pvrsrvctl --start --no-module
        modprobe omaplfb
      ;;
    stop)
        echo "Unloading PVR drivers"
        rmmod omaplfb
        rmmod pvrsrvkm
      ;;
    *)
        echo "Usage: /etc/init.d/load-pvr-drivers.sh {start|stop}"
        exit 1
        ;;
esac

exit 0

