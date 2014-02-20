#!/system/bin/sh
# Allow unique persistent serial numbers for devices connected via usb
# User needs to set unique usb serial number to persist.usb.serialno and
# if persistent serial number is not set then Update USB serial number if
# passed from command line
#
serialno=`getprop persist.usb.serialno`
case "$serialno" in
    "")
    serialnum=`getprop ro.serialno`
    echo "$serialnum" > /sys/class/android_usb/android0/iSerial
    ;;
    * )
    echo "$serialno" > /sys/class/android_usb/android0/iSerial
esac

chown root.system /sys/devices/platform/msm_hsusb/gadget/wakeup
chmod 220 /sys/devices/platform/msm_hsusb/gadget/wakeup

#
# Allow persistent usb charging disabling
# User needs to set usb charging disabled in persist.usb.chgdisabled
#
target=`getprop ro.board.platform`
usbchgdisabled=`getprop persist.usb.chgdisabled`
case "$usbchgdisabled" in
    "") ;; #Do nothing here
    * )
    case $target in
        "msm8660")
        echo "$usbchgdisabled" > /sys/module/pmic8058_charger/parameters/disabled
        echo "$usbchgdisabled" > /sys/module/smb137b/parameters/disabled
	;;
        "msm8960")
        echo "$usbchgdisabled" > /sys/module/pm8921_charger/parameters/disabled
	;;
    esac
esac

#
# Allow USB enumeration with default PID/VID
#
baseband=`getprop ro.baseband`
echo 1  > /sys/class/android_usb/f_mass_storage/lun/nofua
