#!/bin/bash
# Author: Charlie BROMBERG (Shutdown - @_nwodtuhs)

RED='\033[1;31m'
BLUE='\033[1;34m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
NOCOLOR='\033[0m'

function info () {
  echo -e "${BLUE}[*] $@${NOCOLOR}"
}

function debug() {
  echo -e "${YELLOW}[D] $@${NOCOLOR}"
}

function success() {
  echo -e "${GREEN}[+] $@${NOCOLOR}"
}

function prepare_filesystem() {
  info "Preparing filesystem"
  mkdir -p ./windows/
  mkdir -p ./linux/
  mkdir -p ./mac/
  mkdir -p ./cracking/
  mkdir -p ./webshells/
  mkdir -p ./webshells/PHP/
  mkdir -p ./webshells/ASPX/
  mkdir -p ./webshells/JSP/
  mkdir -p "./encrypted_disks/"
}

function chkfs() {
  debug "mkdir $@ if not exist"
  mkdir -p $@
}

function add_sysinternals() {
  info "Downloading SysinternalsSuite"
  chkfs "./windows/"
  wget -nv -O ./windows/SysinternalsSuite.zip "https://download.sysinternals.com/files/SysinternalsSuite.zip"
  unzip -q -o -d ./windows/SysinternalsSuite ./windows/SysinternalsSuite.zip
  rm ./windows/SysinternalsSuite.zip
}

function add_pspy() {
  info "Downloading pspy"
  chkfs "./linux/pspy/"
  wget -nv -O ./linux/pspy/pspy32 "$(curl -s https://github.com/DominicBreuker/pspy/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/pspy32"
  wget -nv -O ./linux/pspy/pspy64 "$(curl -s https://github.com/DominicBreuker/pspy/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/pspy64"
  wget -nv -O ./linux/pspy/pspy32s "$(curl -s https://github.com/DominicBreuker/pspy/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/pspy32s"
  wget -nv -O ./linux/pspy/pspy64s "$(curl -s https://github.com/DominicBreuker/pspy/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/pspy64s"
}

function add_peass() {
  info "Downloading PEAS Suite"
  chkfs "./linux/linPEAS/"
  wget -nv -O ./linux/linPEAS/linpeas.sh "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/linpeas.sh"
  wget -nv -O ./linux/linPEAS/linpeas_darwin_amd64 "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/linpeas_darwin_amd64"
  wget -nv -O ./linux/linPEAS/linpeas_darwin_arm64 "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/linpeas_darwin_arm64"
  wget -nv -O ./linux/linPEAS/linpeas_linux_386 "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/linpeas_linux_386"
  wget -nv -O ./linux/linPEAS/linpeas_linux_amd64 "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/linpeas_linux_amd64"
  wget -nv -O ./linux/linPEAS/linpeas_linux_arm "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/linpeas_linux_arm"
  wget -nv -O ./linux/linPEAS/linpeas_linux_arm64 "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/linpeas_linux_arm64"
  chkfs "./windows/winPEAS/"
  wget -nv -O ./windows/winPEAS/winPEAS.bat "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/winPEAS.bat"
  wget -nv -O ./windows/winPEAS/winPEASany.exe "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/winPEASany.exe"
  wget -nv -O ./windows/winPEAS/winPEASany_ofs.exe "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/winPEASany_ofs.exe"
  wget -nv -O ./windows/winPEAS/winPEASx64.exe "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/winPEASx64.exe"
  wget -nv -O ./windows/winPEAS/winPEASx64_ofs.exe "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/winPEASx64_ofs.exe"
  wget -nv -O ./windows/winPEAS/winPEASx86.exe "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/winPEASx86.exe"
  wget -nv -O ./windows/winPEAS/winPEASx86_ofs.exe "$(curl -s https://github.com/carlospolop/PEASS-ng/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/winPEASx86_ofs.exe"
}

function add_linux_smart_enumeration() {
  info "Downloading Linux Smart Enumeration"
  chkfs "./linux/"
  wget -nv -O ./linux/linux-smart-enumeration.sh "https://github.com/diego-treitos/linux-smart-enumeration/raw/master/lse.sh"
}

function add_linenum() {
  info "Downloading LinEnum"
  chkfs "./linux/"
  wget -nv -O ./linux/LinEnum.sh "https://raw.githubusercontent.com/rebootuser/LinEnum/master/LinEnum.sh"
}

function add_linux_exploit_suggester() {
  info "Downloading Linux Exploit Suggester"
  chkfs "./linux/"
  wget -nv -O ./linux/linux-exploit-suggester.sh "https://raw.githubusercontent.com/mzet-/linux-exploit-suggester/master/linux-exploit-suggester.sh"
}

function add_mimikatz() {
  info "Downloading mimikatz"
  chkfs "./windows/"
  wget -nv -O ./windows/mimikatz_trunk.zip "$(curl -s https://github.com/gentilkiwi/mimikatz/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/mimikatz_trunk.zip"
  unzip -q -o -d ./windows/mimikatz/ ./windows/mimikatz_trunk.zip
  rm ./windows/mimikatz_trunk.zip
}

function add_sharphound() {
  info "Downloading SharpHound"
  chkfs "./windows/"
  wget -nv -O ./windows/SharpHound.exe "https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/SharpHound.exe"
}

function add_juicypotato() {
  info "Downloading JuicyPotato"
  chkfs "./windows/"
  wget -nv -O ./windows/JuicyPotato.exe "$(curl -s https://github.com/ohpe/juicy-potato/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/JuicyPotato.exe"
}

function add_nc() {
  info "Downloading nc for Windows"
  chkfs "./windows/"
  wget -nv -O ./windows/nc.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/nc.exe"
  # chkfs "./linux/"
  # todo add nc.traditional for linux
}

function add_spoolsample() {
  info "Downloading SpoolSample"
  chkfs "./windows/"
  wget -nv -O ./windows/SpoolSample.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample.exe"
  wget -nv -O ./windows/SpoolSample_v4.5_x64.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/SpoolSample_v4.5_x64..exe"
}

function add_diaghub() {
  info "Downloading DiagHub"
  chkfs "./windows/"
  wget -nv -O ./windows/diaghub.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/diaghub.exe"
}

function add_lazagne() {
  info "Downloading LaZagne"
  git -C ./ clone https://github.com/AlessandroZ/LaZagne
  chkfs "./linux/"
  mv ./LaZagne/Linux ./linux/LaZagne
  chkfs "./mac/"
  mv ./LaZagne/Mac ./mac/LaZagne
  chkfs "./windows/"
  mv ./LaZagne/Windows ./windows/LaZagne
  wget -nv -O ./windows/LaZagne/lazagne.exe "$(curl -s https://github.com/AlessandroZ/LaZagne/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')/lazagne.exe"
  rm -rf ./LaZagne
}

function add_sublinacl() {
  info "Downloading Sublinacl"
  chkfs "./windows/"
  wget -nv -O ./windows/sublinacl.exe "https://gitlab.com/onemask/pentest-tools/-/raw/master/windows/sublinacl.exe"
}

function add_plink() {
  info "Downloading plink"
  chkfs "./windows/"
  wget -nv -O ./windows/plink32.exe "https://the.earth.li/~sgtatham/putty/latest/w32/plink.exe"
  wget -nv -O ./windows/plink64.exe "https://the.earth.li/~sgtatham/putty/latest/w64/plink.exe"
}

function add_deepce() {
  info "Downloading deepce"
  chkfs "./linux/"
  wget -nv -O ./linux/deepce.sh "https://github.com/stealthcopter/deepce/raw/master/deepce.sh"
}

function add_webshells() {
  info "Downloading webshells"
  chkfs "./webshells/PHP/wso-webshell/"
  wget -nv -O ./webshells/PHP/wso-webshell/wso.php "https://raw.githubusercontent.com/mIcHyAmRaNe/wso-webshell/master/wso.php"
  sed -i 's/fa769dac7a0a94ee47d8ebe021eaba9e/0fc3bcf177377d328c77b2b51b7f3c9b/g' ./webshells/PHP/wso-webshell/wso.php
  echo 'exegol4thewin' > ./webshells/PHP/wso-webshell/password.txt
  # Setting password to exegol4thewin
  chkfs "./webshells/ASPX"
  wget -nv -O ./webshells/ASPX/webshell.aspx "https://raw.githubusercontent.com/xl7dev/WebShell/master/Aspx/ASPX%20Shell.aspx"
}

function add_ysoserial_net() {
  info "Downloading ysoserial"
  chkfs "./windows/"
  url=$(curl -s https://github.com/pwntester/ysoserial.net/releases/latest | grep -o '"[^"]*"' | tr -d '"' | sed 's/tag/download/')
  tag=${url##*/}
  prefix=${tag:1}
  wget -nv -O ./ysoserial_net.zip "$url/ysoserial-$prefix.zip"
  unzip -d ./windows/ ./ysoserial_net.zip
  rm -r ./windows/ysoserial.net
  mv ./windows/Release/ ./windows/ysoserial.net
  rm ./ysoserial_net.zip
}

function add_http-put-server() {
  info "Downloading http-put-server for Python3"
  chkfs "./linux/"
  wget -nv -O ./linux/http-put-server.py https://gist.githubusercontent.com/mildred/67d22d7289ae8f16cae7/raw/214c213c9415da18a471d1ed04660022cce059ef/server.py
}

function add_azurehound() {
  info "Downloading AzureHound"
  chkfs "./windows/"
  wget -nv -O ./windows/AzureHound.ps1 "https://raw.githubusercontent.com/BloodHoundAD/BloodHound/master/Collectors/AzureHound.ps1"
}

function update_submodules() {
  info "Updating git submodules"
  git submodule init
  git submodule update --recursive --remote
}

# Package dedicated to the download of resources
function add_resources() {
  add_sysinternals
  add_pspy
  add_peass
  add_linux_smart_enumeration
  add_linenum
  add_linux_exploit_suggester
  add_mimikatz
  add_sharphound
  add_juicypotato
  add_nc
  add_spoolsample
  add_diaghub
  add_lazagne
  add_sublinacl
  add_plink
  add_deepce
  add_webshells
  add_ysoserial_net
  add_http-put-server
  add_azurehound
  update_submodules
}

add_resources
success "Done updating Exegol-resources"
