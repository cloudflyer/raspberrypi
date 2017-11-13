#!/bin/bash
echo Raspberry Pi SysInfo.
echo ---------------------
MHZ=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
TEMPE=$(cat /sys/class/thermal/thermal_zone0/temp)

echo Hardware:
echo CPU Speed $(($MHZ/1000)) Mhz 
echo CPU temp=$(($TEMPE/1000)) C
echo GPU $(/opt/vc/bin/vcgencmd measure_temp)
exit 0 
