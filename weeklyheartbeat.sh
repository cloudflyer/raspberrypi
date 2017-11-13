#!/bin/bash
MAILTO=scott@example.com
NET_INTERFACE=eth0
MHZ=$(cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq)
TEMPE=$(cat /sys/class/thermal/thermal_zone0/temp)
UPDATES=`sudo apt-get upgrade -q --assume-no | sed -e '1,3d' -e '$d' | sed '$d'`
ip_int=`/sbin/ifconfig $NET_INTERFACE | sed -n "/inet addr:.*255.255.25[0-5].[0-9]/{s/.*inet addr://; s/ .*//; p}"`
ip_ext=`wget http://ipinfo.io/ip -qO -`
if [ -z "$ip_int" ]; then
  ip_int=0.0.0.0
fi
  echo -e "Hello!!\n\nMy internal ip is $ip_int and the external is $ip_ext\nHardware: CPU Speed: $(($MHZ/1000)) Mhz\nCPU Temperature: $(($TEMPE/1000)) C\nGPU $(/opt/vc/bin/vcgencmd measure_temp)\n\n$UPDATES\n\nYour Raspberry Pi :)" | mail -s "Raspberry Weekly Update - $(uname -n)" $MAILTO 
exit 0
