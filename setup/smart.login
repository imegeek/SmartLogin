#!/usr/bin/bash

# Functions

PUT(){ echo -en "\033[${1};${2}H";}
HIDE(){ echo -en "\033[?25l";}
NORM(){ echo -en "\033[?12l\033[?25h";}
SLP() { sleep 0.3;}
SPL() { sleep 0.1;}
PUTN() { PUT 25 1;}
PUTS(){ PUT 26 3;}
PUTP() { PUT 26 2;}

A_G=$"Access Granted"
A_D=$"Access Denied"


# Colous

GREEN=$"\e[0;1;38;2;0;230;118m"
RED=$"\e[0;1;38;2;200;0;0m"
RESET=$"\e[0m"

clear

printf "
Welcome to Termux!

Wiki:            https://wiki.termux.com
Community forum: https://termux.com/community
Gitter chat:     https://gitter.im/termux/termux
IRC channel:     #termux on freenode

Working with packages:

* Search packages:   pkg search <query>
* Install a package: pkg install <package>
* Upgrade packages:  pkg upgrade

Subscribing to additional repositories:

* Root:     pkg install root-repo
* Unstable: pkg install unstable-repo
* X11:      pkg install x11-repo

Report issues at https://termux.com/issues

"

getPassword() {
unset pass
while IFS= read -p "$prompt" -r -s -n 1 char
do
    if [[ $char == $'\0' ]] ; then
        break
    fi
    if [[ $char == $'\177' ]] ; then
        prompt=$'\b \b'
        pass="${pass%?}"
    else
        prompt='*'
        pass+="$char"
    fi
done
}

exit_on_signal_SIGINT () {
   { printf "\n\e[0;1;38;2;200;0;0m[!] Program interrupted.\e[0m" 2>&1; echo; }
     printf "\n[Authentication failed for login]"
     kill -9 $PPID
}

exit_on_signal_SIGTSTP () {
    { printf "\n\e[0;1;38;2;200;0;0m[!] Program terminated.\e[0m" 2>&1; echo; }
      printf "\n[Authentication failed for login]"
      kill -9 $PPID
}

trap exit_on_signal_SIGINT SIGINT ; trap exit_on_signal_SIGTSTP SIGTSTP

progress() {
PUTN
HIDE
printf "┌────────────────┐
│                │
└────────────────┘\e"
PUTP
echo -ne "${GREEN}\r"
PUTP
echo -ne "█\r"
SPL
PUTP
echo -ne "██\r"
SPL
PUTP
echo -ne "███\r"
SPL
PUTP
echo -ne "████\r"
SPL
PUTP
echo -ne "█████\r"
SPL
PUTP
echo -ne "██████\r"
SPL
PUTP
echo -ne "███████\r"
SPL
PUTP
echo -ne "████████\r"
SPL
PUTP
echo -ne "█████████\r"
SPL
PUTP
echo -ne "██████████\r"
SPL
PUTP
echo -ne "███████████\r"
SPL
PUTP
echo -ne "████████████\r"
SPL
PUTP
echo -ne "█████████████\r"
SPL
PUTP
echo -ne "██████████████\r"
sleep 0
PUTP
echo -ne "███████████████\r"
sleep 0
PUTP
echo -ne "████████████████\r"
}

access_granted() {
HIDE
PUTN
printf "┌────────────────┐
│                │
└────────────────┘"
PUTS
echo -ne "${GREEN}\r"
PUTS
echo -ne "${A_G}\r"
SLP
PUTS
echo -ne "              \r"
SLP
PUTS
echo -ne "${A_G}\r"
SLP
PUTS
echo -ne "              \r"
SLP
PUTS
echo -ne "${A_G}\r"
SLP
PUTS
echo -ne "              \r"
SLP
PUTS
echo -ne "${A_G}\r"
echo -e "\n"
}

access_denied() {
PUTN
printf "┌────────────────┐
│                │
└────────────────┘"

PUTS
echo -ne "${RED}\r"
PUTS
echo -ne "${A_D}\r"
SLP
PUTS
echo -ne "             \r"
SLP
PUTS
echo -ne "${A_D}\r"
SLP
PUTS
echo -ne "             \r"
SLP
PUTS
echo -ne "${A_D}\r"
SLP
PUTS
echo -ne "             \r"
SLP
PUTS
echo -ne "${A_D}\r"
echo -e "\n"
}

main() {
printf "Enter Username for Login : "
read user
if [[ $user = "123" ]];then
printf "Enter Password for Login : "
getPassword
if [[ $pass = "123" ]];then
progress
printf "${GREEN}"
access_granted ; printf "${RESET}"
echo""
NORM
else
progress
printf "${RED}"
access_denied
printf "\n[Authentication failed for login]"
kill -9 $PPID
fi
else
printf "Enter Password for Login : "
getPassword
progress
printf "${RED}"
access_denied
printf "\n[Authentication failed for login]"
kill -9 $PPID
fi
}
trap '' SIGTSTP
trap '' SIGINT
main
