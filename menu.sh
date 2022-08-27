#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# ==========================================
# Getting
dateFromServer=$(curl -v --insecure --silent https://google.com/ 2>&1 | grep Date | sed -e 's/< Date: //')
biji=`date +"%Y-%m-%d" -d "$dateFromServer"`
#########################

BURIQ () {
    curl -sS https://raw.githubusercontent.com/kenDevXD/src/main/ip > /root/tmp
    data=( `cat /root/tmp | grep -E "^### " | awk '{print $2}'` )
    for user in "${data[@]}"
    do
    exp=( `grep -E "^### $user" "/root/tmp" | awk '{print $3}'` )
    d1=(`date -d "$exp" +%s`)
    d2=(`date -d "$biji" +%s`)
    exp2=$(( (d1 - d2) / 86400 ))
    if [[ "$exp2" -le "0" ]]; then
    echo $user > /etc/.$user.ini
    else
    rm -f /etc/.$user.ini > /dev/null 2>&1
    fi
    done
    rm -f /root/tmp
}

MYIP=$(curl -sS ipv4.icanhazip.com)
Name=$(curl -sS https://raw.githubusercontent.com/kenDevXD/src/main/ip | grep $MYIP | awk '{print $2}')
echo $Name > /usr/local/etc/.$Name.ini
CekOne=$(cat /usr/local/etc/.$Name.ini)

Bloman () {
if [ -f "/etc/.$Name.ini" ]; then
CekTwo=$(cat /etc/.$Name.ini)
    if [ "$CekOne" = "$CekTwo" ]; then
        res="Expired"
    fi
else
res="Permission Accepted..."
fi
}

PERMISSION () {
    MYIP=$(curl -sS ipv4.icanhazip.com)
    IZIN=$(curl -sS https://raw.githubusercontent.com/kenDevXD/src/main/ip | awk '{print $4}' | grep $MYIP)
    if [ "$MYIP" = "$IZIN" ]; then
    Bloman
    else
    res="Permission Denied!"
    fi
    BURIQ
}

x="ok"

cekray=`cat /root/log-install.txt | grep -ow "XRAY" | sort | uniq`
if [ "$cekray" = "XRAY" ]; then
rekk='XRAY'
bec='xray'
else
rekk='V2RAY'
bec='v2ray'
fi

PERMISSION

if [ "$res" = "Expired" ]; then
Exp="\e[36mExpired\033[0m"
rm -f /home/needupdate > /dev/null 2>&1
else
Exp=$(curl -sS https://raw.githubusercontent.com/kenDevXD/src/main/ip | grep $MYIP | awk '{print $3}')
fi
clear
echo -e "\e[36m╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕\033[0m"
echo -e " \E[44;1;39m        ⇱ AutoScript By KennXV ⇲        \E[0m"
echo -e " \E[44;1;39m            ⇱ Informasi VPS SERVER ⇲            \E[0m"
echo -e "\e[36m╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛\033[0m"
uphours=`uptime -p | awk '{print $2,$3}' | cut -d , -f1`
upminutes=`uptime -p | awk '{print $4,$5}' | cut -d , -f1`
uptimecek=`uptime -p | awk '{print $6,$7}' | cut -d , -f1`
cekup=`uptime -p | grep -ow "day"`
IPVPS=$(curl -s ipinfo.io/ip )
serverV=$( curl -sS https://raw.githubusercontent.com/kenDevXD/src/main/versi)

if [ "$cekup" = "day" ]; then
echo    -e   "System Uptime   :  $uphours $upminutes $uptimecek"
else
echo -e   "System Uptime   :  $uphours $upminutes"
fi
echo -e "Use Core        :  $rekk"
echo -e "Current Domain  :  $(cat /etc/$bec/domain)"
echo -e "IP-VPS          :  $IPVPS"
echo -e "\e[36m╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕\033[0m"
echo -e " \E[44;1;39m             ⇱ Status Layanan Service ⇲         \E[0m"
echo -e "\e[36m╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛\033[0m"

 echo -e " [ SSH WebSocket : ON ]     [ XRAY : ON ]      [ NGINX : ON ]"

echo -e "\e[36m╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕\033[0m"
echo -e " \E[44;1;39m               ⇱ Status Layanan VPS ⇲           \E[0m"
echo -e "\e[36m╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛\033[0m"

echo -e " [\033[1;36m01\033[0m] • SSH-WS Manager       [\033[1;36m08\033[0m] • Info Pembuat
 [\033[1;36m02\033[0m] • Vmess Manager        [\033[1;36m09\033[0m] • Renew Cert
 [\033[1;36m03\033[0m] • Vless Manager        [\033[1;36m10\033[0m] • Speedtest
 [\033[1;36m04\033[0m] • Trojan Manager       [\033[1;36m11\033[0m] • Coming Soon
 [\033[1;36m05\033[0m] • SS Manager           [\033[1;36m12\033[0m] • Cek Bandwith
 [\033[1;36m06\033[0m] • Add Private Domain   [\033[1;36m13\033[0m] • BACKUP
 [\033[1;36m07\033[0m] • Running All Service  [\033[1;36m14\033[0m] • RESTORE DATA"

echo -e "\e[36m╒━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╕\033[0m"

if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
echo -e "Version       :\033[1;36m $(cat /opt/.ver) Latest Version\e[0m"
echo -e "Client Name   : $Name"
echo -e "Expiry script : $Exp"
rm -f /home/needupdate > /dev/null 2>&1
else
rm /dev/.permiss > /dev/null 2>&1
touch /home/needupdate > /dev/null 2>&1
echo -e "\033[0;33mVersion : $(cat /opt/.ver) Update available to $serverV\e[0m"
fi
echo -e "\e[36m╘━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╛\033[0m"
echo -e ""
echo -ne "Select menu : "; read x
if [[ $(cat /opt/.ver) = $serverV ]] > /dev/null 2>&1; then
    if [[ $x -eq 1 ]]; then
       ssh-menu
    elif [[ $x -eq 2 ]]; then
       v2ray-menu
    elif [[ $x -eq 3 ]]; then
       trojan-menu
    elif [[ $x -eq 4 ]]; then
       ssgrpc-menu
    elif [[ $x -eq 5 ]]; then
       add-host
    elif [[ $x -eq 6 ]]; then
       running
    elif [[ $x -eq 7 ]]; then
       about
    elif [[ $x -eq 8 ]]; then
       crtv2ray
    elif [[ $x -eq 9 ]]; then
       speedtest
    elif [[ $x -eq 10 ]]; then
       about
    elif [[ $x -eq 11 ]]; then
       about
    elif [[ $x -eq 12 ]]; then
       about
    elif [[ $x -eq 13 ]]; then
       about
    elif [[ $x -eq 14 ]]; then
       about
    elif [[ $x -eq 15 ]]; then
       about
    elif [[ $x -eq 16 ]]; then
       about
    elif [[ $x -eq 17 ]]; then
       about
     elif [[ $x -eq 18 ]]; then
       about
    else
       menu
    fi
else
    if [[ $x -eq 69 ]]; then
       wget -q -O /usr/bin/update-script "https://raw.githubusercontent.com/bokir-tampan/biji/main/dll/system/update-script.sh" && chmod +x /usr/bin/update-script
       screen -S upds update-script
       menu
    elif [[ $x -eq 1 ]]; then
       ssh-menu
    elif [[ $x -eq 2 ]]; then
       v2ray-menu
    elif [[ $x -eq 3 ]]; then
       trojan-menu
    elif [[ $x -eq 4 ]]; then
       ssgrpc-menu
    elif [[ $x -eq 5 ]]; then
       add-host
    elif [[ $x -eq 6 ]]; then
       running
    elif [[ $x -eq 7 ]]; then
       about
    elif [[ $x -eq 8 ]]; then
       crtv2ray
    elif [[ $x -eq 9 ]]; then
       speedtest
    elif [[ $x -eq 10 ]]; then
       about
    elif [[ $x -eq 11 ]]; then
       about
    elif [[ $x -eq 12 ]]; then
       about
    elif [[ $x -eq 13 ]]; then
       about
    elif [[ $x -eq 14 ]]; then
       about
    elif [[ $x -eq 15 ]]; then
       about
    elif [[ $x -eq 16 ]]; then
       about
    elif [[ $x -eq 17 ]]; then
       about
     elif [[ $x -eq 18 ]]; then
       about
    else
       menu
    fi
fi
