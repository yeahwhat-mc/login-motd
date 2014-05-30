#!/bin/bash
# Description: MOTD for Debian/Ubuntu
# 2013/07/15 @ysaotome
# 2014/05/29 @frdmn

BIN_DATE='/bin/date'
BIN_FIGLET='/usr/bin/figlet'
BIN_HOSTNAME='/bin/hostname'
BIN_IP='/sbin/ip'
BIN_GREP='/bin/grep'
BIN_SED='/bin/sed'
BIN_UPTIME='/usr/bin/uptime'
BIN_CAT='/bin/cat'
BIN_LSB_RELEASE='/usr/bin/lsb_release'
BIN_UNAME='/bin/uname'
BIN_FREE='/usr/bin/free'
BIN_HEAD='/usr/bin/head'
BIN_TAIL='/usr/bin/tail'
BIN_DF='/bin/df'
BIN_AWK='/usr/bin/awk'
BIN_BC='/usr/bin/bc'
BIN_PS='/bin/ps'

COLOR_LIGHT_GREEN='\033[1;32m'
COLOR_LIGHT_BLUE='\033[1;34m'
COLOR_YELLOW='\033[1;33m'
COLOR_RED='\033[0;31m'
COLOR_WHITE='\033[1;37m'
COLOR_DEFAULT='\033[0m'

echo -e "
${COLOR_LIGHT_GREEN}$(${BIN_FIGLET} -ckw 100 -f slant $(${BIN_HOSTNAME} -s))
${COLOR_WHITE}Date and time             = ${COLOR_LIGHT_BLUE}$(${BIN_DATE})
${COLOR_WHITE}Hostname                  = ${COLOR_LIGHT_BLUE}$(${BIN_HOSTNAME})
${COLOR_WHITE}Global IP Addresses       = ${COLOR_LIGHT_BLUE}$(${BIN_IP} addr show eth0 2>/dev/null | ${BIN_GREP} 'inet ' | ${BIN_SED} -e 's/.*inet \([^ ]*\)\/.*/\1/')
${COLOR_WHITE}VPN IP Address            = ${COLOR_LIGHT_BLUE}$(${BIN_IP} addr show tun0 2>/dev/null | ${BIN_GREP} 'inet ' | awk -F" " '{print $2}')
${COLOR_WHITE}Uptime                    = ${COLOR_LIGHT_BLUE}$(${BIN_UPTIME} | ${BIN_SED} -e 's/^ //')
${COLOR_WHITE}Release                   = ${COLOR_LIGHT_BLUE}$(${BIN_LSB_RELEASE} -d --short)
${COLOR_WHITE}Kernel                    = ${COLOR_LIGHT_BLUE}$(${BIN_UNAME} -ro)
${COLOR_WHITE}CPU Usage (Core)          = ${COLOR_LIGHT_BLUE}$(echo $(${BIN_PS} -eo pcpu | ${BIN_AWK} 'NR>1' | ${BIN_AWK} '{tot=tot+$1} END {print tot}') / $(${BIN_CAT} /proc/cpuinfo | ${BIN_GREP} -c processor) | ${BIN_BC} )%
${COLOR_WHITE}Memory         Used/Total = ${COLOR_LIGHT_BLUE}$(${BIN_FREE} -m | ${BIN_HEAD} -n 2 | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $3'})/$(${BIN_FREE} -m | ${BIN_HEAD} -n 2 | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $2'})MB
${COLOR_WHITE}Swap           Used/Total = ${COLOR_LIGHT_BLUE}$(${BIN_FREE} -m | tail -n 1 | ${BIN_AWK} {'print $3'})/$(${BIN_FREE} -m | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $2'})MB
${COLOR_WHITE}Disk(/)        Used/Total = ${COLOR_LIGHT_BLUE}$(${BIN_DF} -h / | tail -n 1 | ${BIN_AWK} {'print $3'})/$(${BIN_DF} -h / | ${BIN_TAIL} -n 1 | ${BIN_AWK} {'print $2'})
${COLOR_DEFAULT}"

unset BIN_DATE BIN_FIGLET BIN_HOSTNAME BIN_IP BIN_GREP BIN_SED BIN_UPTIME BIN_CAT BIN_LSB_RELEASE BIN_UNAME BIN_FREE BIN_HEAD BIN_TAIL BIN_DF BIN_AWK BIN_BC BIN_PS
unset COLOR_LIGHT_GREEN COLOR_LIGHT_BLUE COLOR_YELLOW COLOR_RED COLOR_WHITE COLOR_DEFAULT
