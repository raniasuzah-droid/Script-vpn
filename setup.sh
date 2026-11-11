#!/bin/bash
sysctl -w net.ipv6.conf.all.disable_ipv6=1 >/dev/null 2>&1
sysctl -w net.ipv6.conf.default.disable_ipv6=1 >/dev/null 2>&1
# --- local config: no developer token, no developer chat ---
export IZIN="https://raw.githubusercontent.com/raniasuzah-droid/license/main/ip"
export REPO="https://raw.githubusercontent.com/raniasuzah-droid/Script-vpn/main/"
export USERGIT="raniasuzah-droid"
export EMAILGIT="sonic@localhost"
export REPIZIN="https://github.com/raniasuzah-droid/license"
export CHATID=""
export KEY=""
export KEYBK=""
# --- end local config ---
function CEKIP () {
clear
echo -e "${green}┌────────────────────────────────────────────┐${NC}"
echo -e "${green}│        U L T R A S O N I C   V P N         │${NC}"
echo -e "${green}│      LICENSE: LIFETIME - SELF HOSTED       │${NC}"
echo -e "${green}└────────────────────────────────────────────┘${NC}"
sleep 1
domain
Pasang
}
clear
red='\e[1;31m'
green='\e[0;32m'
yell='\e[1;33m'
tyblue='\e[1;36m'
NC='\033[0m'
purple() { echo -e "\\033[35;1m${*}\${NC}"; }
tyblue() { echo -e "\\033[36;1m${*}\${NC}"; }
yellow() { echo -e "\\033[33;1m${*}\${NC}"; }
green() { echo -e "\\033[32;1m${*}\${NC}"; }
red() { echo -e "\\033[31;1m${*}\${NC}"; }
cd /root
if [ "${EUID}" -ne 0 ]; then
echo "You need to run this script as root"
exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
echo "OpenVZ is not supported"
exit 1
fi
secs_to_human() {
echo "Installation time : $(( ${1} / 3600 )) hours $(( (${1} / 60) % 60 )) minute's $(( ${1} % 60 )) seconds"
}
mkdir -p /etc/xray
mkdir -p /var/lib/ >/dev/null 2>&1
echo "IP=" >> /var/lib/ipvps.conf
clear
echo -e  "${green}┌──────────────────────────────────────────┐${NC}"
echo -e  "${green}│              MASUKKAN NAMA KAMU          │${NC}"
echo -e  "${green}└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $name =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan Nama Kamu Disini tanpa spasi : " -e name
done
echo ".::. ULTRASONIC TUNNELING .::." > /etc/xray/username
echo ""
clear
author=$name
echo "${name}" > /etc/hostname
hostnamectl set-hostname "${name}"

# Ambil IP lokal (IP pertama yang terdeteksi)
localip=$(hostname -I | awk '{print $1}')

# Cek apakah hostname sudah ada di /etc/hosts
if ! grep -q "$localip" /etc/hosts; then
    echo "$localip $name" >> /etc/hosts
else
    sed -i "/$localip/c\\$localip $name" /etc/hosts
fi

# [hardened] key2() removed - no developer licence registration
function domain(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    (
        [[ -e $HOME/fim ]] && rm $HOME/fim
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        touch $HOME/fim
    ) >/dev/null 2>&1 &
    tput civis
    echo -ne "  \033[0;33mUpdate Domain.. \033[1;37m- \033[0;33m["
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1s
        done
        [[ -e $HOME/fim ]] && rm $HOME/fim && break
        echo -e "\033[0;33m]"
        sleep 1s
        tput cuu1
        tput dl1
        echo -ne "  \033[0;33mUpdate Domain... \033[1;37m- \033[0;33m["
    done
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm
}
res1() {
wget ${REPO}install/pointing.sh && chmod +x pointing.sh && ./pointing.sh
clear
}
clear
cd
echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│ \033[1;37mPlease select a your Choice to Set Domain${green}│${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│  [ 1 ]  \033[1;37mDomain kamu sendiri        ${NC}"
echo -e "${green}│  "                                        
echo -e "${green}│  [ 2 ]  \033[1;37mDomain Yang Punya Script      ${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
until [[ $domain =~ ^[132]+$ ]]; do 
read -p "   Please select numbers 1  atau 2 : " domain
done
if [[ $domain == "1" ]]; then
clear
echo -e  "${green}┌──────────────────────────────────────────┐${NC}"
echo -e  "${green}│              \033[1;37mTERIMA KASIH                ${green}│${NC}"
echo -e  "${green}│         \033[1;37mSUDAH MENGGUNAKAN SCRIPT         ${green}│${NC}"
echo -e  "${green}│                \033[1;37mDARI SAYA                 ${green}│${NC}"
echo -e  "${green}└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dnss =~ ^[a-zA-Z0-9_.-]+$ ]]; do 
read -rp "Masukan domain kamu Disini : " -e dnss
done

rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
touch /etc/xray/domain
echo "$dnss" > /root/domain
echo "$dnss" > /etc/xray/domain
echo "IP=$dnss" > /var/lib/kyt/ipvps.conf
echo ""
clear
fi
if [[ $domain == "2" ]]; then
echo -e  "${green}┌──────────────────────────────────────────┐${NC}"
echo -e  "${green}│  \033[1;37mContoh subdomain xxx.Ultrasonic.site        ${green}${NC}"
echo -e  "${green}│    \033[1;37mxxx jadi subdomain kamu               ${green}${NC}"
echo -e  "${green}└──────────────────────────────────────────┘${NC}"
echo " "
until [[ $dn1 =~ ^[a-zA-Z0-9_.-]+$ ]]; do
read -rp "Masukan subdomain kamu Disini tanpa spasi : " -e dn1
done

rm -rf /etc/v2ray
rm -rf /etc/nsdomain
rm -rf /etc/per
mkdir -p /etc/xray
touch /etc/xray/domain
echo "$dn1" > /root/domain
echo "$dn1" > /etc/xray/domain
echo "IP=$dn1" > /var/lib/kyt/ipvps.conf
echo ""
clear
cd
sleep 1
fun_bar 'res1'
clear
fi
}
function Pasang(){
cd
wget ${REPO}tools.sh &> /dev/null
chmod +x tools.sh 
./tools.sh
clear
start=$(date +%s)
ln -fs /usr/share/zoneinfo/Asia/Jakarta /etc/localtime
apt install git curl -y >/dev/null 2>&1
apt install python -y >/dev/null 2>&1
}
function Installasi(){
fun_bar() {
    CMD[0]="$1"
    CMD[1]="$2"
    
    (
        # Hapus file fim jika ada
        [[ -e $HOME/fim ]] && rm -f $HOME/fim
        
        # Jalankan perintah di background dan sembunyikan output
        ${CMD[0]} -y >/dev/null 2>&1
        ${CMD[1]} -y >/dev/null 2>&1
        
        # Buat file fim untuk menandakan selesai
        touch $HOME/fim
    ) >/dev/null 2>&1 &

    tput civis # Sembunyikan kursor
    echo -ne "  \033[0;33mLagi Menginstal File \033[1;37m- \033[0;33m["
    
    while true; do
        for ((i = 0; i < 18; i++)); do
            echo -ne "\033[0;32m#"
            sleep 0.1
        done
        
        # Jika file fim ada, hapus dan keluar dari loop
        if [[ -e $HOME/fim ]]; then
            rm -f $HOME/fim
            break
        fi
        
        echo -e "\033[0;33m]"
        sleep 1
        tput cuu1 # Kembali ke baris sebelumnya
        tput dl1   # Hapus baris sebelumnya
        echo -ne "  \033[0;33mLagi Menginstal File \033[1;37m- \033[0;33m["
    done
    
    echo -e "\033[0;33m]\033[1;37m -\033[1;32m Succes !\033[1;37m"
    tput cnorm # Tampilkan kursor kembali
}



res2() {
wget ${REPO}install/ssh-vpn.sh && chmod +x ssh-vpn.sh && ./ssh-vpn.sh
clear
} 

res3() {
wget ${REPO}install/ins-xray.sh && chmod +x ins-xray.sh && ./ins-xray.sh
clear
}

res4() {
wget ${REPO}sshws/insshws.sh && chmod +x insshws.sh && ./insshws.sh
clear
}

res5() {
wget ${REPO}install/set-br.sh && chmod +x set-br.sh && ./set-br.sh
clear
}

res6() {
wget ${REPO}sshws/ohp.sh && chmod +x ohp.sh && ./ohp.sh
clear
}

res7() {
wget ${REPO}menu/update.sh && chmod +x update.sh && ./update.sh
clear
}

res8() {
wget ${REPO}slowdns/installsl.sh && chmod +x installsl.sh && ./installsl.sh
clear
}

res9() {
wget ${REPO}install/udp-custom.sh && chmod +x udp-custom.sh && ./udp-custom.sh
clear
}
if [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "ubuntu" ]]; then
echo -e "${green}Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${NC}"
setup_ubuntu
elif [[ $(cat /etc/os-release | grep -w ID | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/ID//g') == "debian" ]]; then
echo -e "${green}Setup nginx For OS Is $(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${NC}"
setup_debian
else
echo -e " Your OS Is Not Supported ( ${YELLOW}$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')${FONT} )"
fi
}
function setup_debian(){
echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│      PROCESS INSTALLED SSH & OPENVPN     │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res2'

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           PROCESS INSTALLED XRAY         │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res3'

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│       PROCESS INSTALLED WEBSOCKET SSH    │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res4'

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│       PROCESS INSTALLED BACKUP MENU      │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res5'

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           PROCESS INSTALLED OHP          │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res6'


echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           DOWNLOAD EXTRA MENU            │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res7'

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           DOWNLOAD SYSTEM                │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res8'

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           DOWNLOAD UDP COSTUM            │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
fun_bar 'res9'
}
function setup_ubuntu(){
echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│      PROCESS INSTALLED SSH & OPENVPN     │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res2

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           PROCESS INSTALLED XRAY         │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res3

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│       PROCESS INSTALLED WEBSOCKET SSH    │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res4

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│       PROCESS INSTALLED BACKUP MENU      │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res5

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           PROCESS INSTALLED OHP          │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res6


echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           DOWNLOAD EXTRA MENU            │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res7

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           DOWNLOAD SYSTEM                │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res8

echo -e "${green}┌──────────────────────────────────────────┐${NC}"
echo -e "${green}│           DOWNLOAD UDP COSTUM            │${NC}"
echo -e "${green}└──────────────────────────────────────────┘${NC}"
res9
}
function iinfo(){
domain=$(cat /etc/xray/domain)
TIMES="10"
URL="https://api.telegram.org/bot$KEY/sendMessage"
ISP=$(cat /etc/xray/isp)
CITY=$(cat /etc/xray/city)
domain=$(cat /etc/xray/domain) 
TIME=$(date +'%Y-%m-%d %H:%M:%S')
RAMMS=$(free -m | awk 'NR==2 {print $2}')
MODEL2=$(cat /etc/os-release | grep -w PRETTY_NAME | head -n1 | sed 's/=//g' | sed 's/"//g' | sed 's/PRETTY_NAME//g')
MYIP=$(curl -sS ipv4.icanhazip.com)
IZIND=$(cat /usr/local/etc/sc-license 2>/dev/null || curl -sS $IZIN | grep $MYIP | awk '{print $3}' )
d1=$(date -d "$IZIND" +%s)
d2=$(date -d "$today" +%s)
EXP=$(( (d1 - d2) / 86400 ))

TEXT="
<code>━━━━━━━━━━━━━━━━━━━━
⚠️ AUTOSCRIPT PREMIUM ⚠️
━━━━━━━━━━━━━━━━━━━━
NAME : ${author}
TIME : ${TIME} WIB
DOMAIN : ${domain}
IP : ${MYIP}
ISP : ${ISP} $CITY
OS LINUX : ${MODEL2}
RAM : ${RAMMS} MB
EXP SCRIPT : $EXP Days
━━━━━━━━━━━━━━━━━━━━
<i> Notifikasi Installer Script...</i> </code>
"'&reply_markup={"inline_keyboard":[[{"text":"🔥ᴏʀᴅᴇʀ","url":"https://t.me/Newbie_Store24"},{"text":"🔥GRUP","url":"https://t.me/newbielearning"}]]}'
curl -s --max-time $TIMES -d "chat_id=$CHATID&disable_web_page_preview=1&text=$TEXT&parse_mode=html" $URL >/dev/null
clear
}
# Tentukan nilai baru yang diinginkan untuk fs.file-max
NEW_FILE_MAX=65535  # Ubah sesuai kebutuhan Anda

# Nilai tambahan untuk konfigurasi netfilter
NF_CONNTRACK_MAX="net.netfilter.nf_conntrack_max=262144"
NF_CONNTRACK_TIMEOUT="net.netfilter.nf_conntrack_tcp_timeout_time_wait=30"

# File yang akan diedit
SYSCTL_CONF="/etc/sysctl.conf"

# Ambil nilai fs.file-max saat ini
CURRENT_FILE_MAX=$(grep "^fs.file-max" "$SYSCTL_CONF" | awk '{print $3}' 2>/dev/null)

# Cek apakah nilai fs.file-max sudah sesuai
if [ "$CURRENT_FILE_MAX" != "$NEW_FILE_MAX" ]; then
    # Cek apakah fs.file-max sudah ada di file
    if grep -q "^fs.file-max" "$SYSCTL_CONF"; then
        # Jika ada, ubah nilainya
        sed -i "s/^fs.file-max.*/fs.file-max = $NEW_FILE_MAX/" "$SYSCTL_CONF" >/dev/null 2>&1
    else
        # Jika tidak ada, tambahkan baris baru
        echo "fs.file-max = $NEW_FILE_MAX" >> "$SYSCTL_CONF" 2>/dev/null
    fi
fi

# Cek apakah net.netfilter.nf_conntrack_max sudah ada
if ! grep -q "^net.netfilter.nf_conntrack_max" "$SYSCTL_CONF"; then
    echo "$NF_CONNTRACK_MAX" >> "$SYSCTL_CONF" 2>/dev/null
fi

# Cek apakah net.netfilter.nf_conntrack_tcp_timeout_time_wait sudah ada
if ! grep -q "^net.netfilter.nf_conntrack_tcp_timeout_time_wait" "$SYSCTL_CONF"; then
    echo "$NF_CONNTRACK_TIMEOUT" >> "$SYSCTL_CONF" 2>/dev/null
fi

# Terapkan perubahan
sysctl -p >/dev/null 2>&1

# --- [hardened] bootstrap local lifetime license (no developer dependency) ---
mkdir -p /usr/local/etc
MYIPBOOT=$(curl -sS ipv4.icanhazip.com)
if [ ! -s /usr/local/etc/sc-license ]; then
  printf '### %s 2099-12-31 %s ON 999 VIP\n' "${author:-local}" "$MYIPBOOT" > /usr/local/etc/sc-license
  chmod 644 /usr/local/etc/sc-license
fi
cat > /usr/local/bin/sc-license-get <<'EOFLIC'
#!/bin/bash
if [ -s /usr/local/etc/sc-license ]; then
  cat /usr/local/etc/sc-license
else
  curl -sS https://raw.githubusercontent.com/raniasuzah-droid/license/main/ip
fi
EOFLIC
chmod +x /usr/local/bin/sc-license-get
# --- end bootstrap ---

CEKIP
Installasi
cat> /root/.profile << END
if [ "$BASH" ]; then
if [ -f ~/.bashrc ]; then
. ~/.bashrc
fi
fi
mesg n || true
clear
welcome
END
chmod 644 /root/.profile
if [ -f "/root/log-install.txt" ]; then
rm /root/log-install.txt > /dev/null 2>&1
fi
if [ -f "/etc/afak.conf" ]; then
rm /etc/afak.conf > /dev/null 2>&1
fi
history -c
serverV=$( curl -sS ${REPO}versi  )
echo $serverV > /opt/.ver
echo "00" > /home/daily_reboot
aureb=$(cat /home/daily_reboot)
b=11
if [ $aureb -gt $b ]
then
gg="PM"
else
gg="AM"
fi
cd
curl -sS ipv4.icanhazip.com > /etc/myipvps
curl -sS ipv4.icanhazip.com > /usr/bin/.ipvps
curl -s ipinfo.io/city?token=75082b4831f909 >> /etc/xray/city
curl -s ipinfo.io/org?token=75082b4831f909  | cut -d " " -f 2-10 >> /etc/xray/isp
rm /root/*.sh* >/dev/null 2>&1
secs_to_human "$(($(date +%s) - ${start}))" | tee -a log-install.txt
sleep 3
echo  ""
cd
iinfo
echo -e "${green}┌────────────────────────────────────────────┐${NC}"
echo -e "${green}│  Install SCRIPT SELESAI..                  │${NC}"
echo -e "${green}└────────────────────────────────────────────┘${NC}"
echo  ""
sleep 4
echo -e "[ ${yell}WARNING${NC} ] Do you want to reboot now ? (y/n)? "
read answer
case "$answer" in
  [Yy]*) reboot ;;
  *)     echo -e "  [OK] Reboot dilewati. Jalankan 'reboot' manual kalau perlu."; exit 0 ;;
esac
