#!/system/bin/sh

MODDIR=${0%/*}

PATH=/system/bin:/sbin:/sbin/.core/busybox:/system/xbin

until [[ $(getprop sys.boot_completed) = 1 ]] && [[ $(getprop dev.bootcomplete) = 1 ]] && [[ $(getprop service.bootanim.exit) = 1 ]] && [[ $(getprop init.svc.bootanim) = stopped ]]; do

    sleep 1

done

sleep 10

su -M -c settings put global airplane_mode_on 0

su -M -c am broadcast -a android.intent.action.AIRPLANE_MODE

su -M -c svc data enable

su -M -c svc wifi enable

su -M -c settings put secure location_providers_allowed +gps;

su -M -c settings put secure location_providers_allowed +network;

exit 0
