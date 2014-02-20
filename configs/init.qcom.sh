#!/system/bin/sh

target=`getprop ro.board.platform`

#
# Function to start sensors for DSPS enabled platforms
#
start_sensors()
{
    mkdir -p /data/system/sensors
    touch /data/system/sensors/settings
    chmod 665 /data/system/sensors

    mkdir -p /data/misc/sensors
    chmod 775 /data/misc/sensors

    if [ ! -s /data/system/sensors/settings ]; then
        # If the settings file is empty, enable sensors HAL
        # Otherwise leave the file with it's current contents
        echo 1 > /data/system/sensors/settings
    fi
    start sensors
}

baseband=`getprop ro.baseband`

#
# Suppress default route installation during RA for IPV6; user space will take
# care of this
#
for file in /proc/sys/net/ipv6/conf/*
do
  echo 0 > $file/accept_ra_defrtr
done

#
# Start gpsone_daemon for SVLTE Type I & II devices
#
case "$target" in
        "msm7630_fusion")
        start gpsone_daemon
esac
case "$baseband" in
        "svlte2a")
        start gpsone_daemon
        start bridgemgrd
esac

case "$target" in
    "msm7630_surf" | "msm7630_1x" | "msm7630_fusion")
        value=`cat /sys/devices/system/soc/soc0/hw_platform`
        case "$value" in
            "Fluid")
             start profiler_daemon;;
        esac
        ;;
    "msm8660" )
        platformvalue=`cat /sys/devices/system/soc/soc0/hw_platform`
        case "$platformvalue" in
            "Fluid")
                start_sensors
                start profiler_daemon;;
        esac
        ;;
    "msm8960")
        case "$baseband" in
            "msm")
                start_sensors;;
        esac

        platformvalue=`cat /sys/devices/system/soc/soc0/hw_platform`
        case "$platformvalue" in
             "Fluid")
                 start profiler_daemon;;
             "Liquid")
                 start profiler_daemon;;
        esac
        ;;

esac
