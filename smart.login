#!/usr/bin/bash

if [ -f "/data/data/com.termux/files/usr/bin/recent.setup" ];then
cd /data/data/com.termux/files/usr/bin
chmod +x recent.setup
source /data/data/com.termux/files/usr/bin/recent.setup;fi

printf "Setup a New Login Authentication :
Maximum Password & Username : 8 Digits\n\n"
printf "Enter a New Username : "
read username
if [ ${#username} -gt 8 ]; then
echo "Please Enter Username within 8 Digits."
exit 0
fi
printf "Enter a New Password : "
read password
if [ ${#password} -gt 8 ]; then
echo "Please Enter Password within 8 Digits."
exit 0
fi

cd - &> /dev/null
cd setup
cp setup.config smart.login
echo "Login was  Successfully completed, Open New Session."

echo"">> smart.login
echo "main() {" >> smart.login
echo 'printf "Enter Username for Login : "' >> smart.login
echo "read user" >> smart.login
echo 'if [[ $user = "'$username'" ]];then' >> smart.login
echo 'printf "Enter Password for Login : "' >> smart.login
echo "getPassword" >> smart.login
echo 'if [[ $pass = "'$password'" ]];then' >> smart.login
echo "progress" >> smart.login
echo 'printf "${GREEN}"' >> smart.login
echo 'access_granted ; printf "${RESET}"' >> smart.login
echo 'echo""' >> smart.login
echo "NORM" >> smart.login
echo "else" >> smart.login
echo "progress" >> smart.login
echo 'printf "${RED}"' >> smart.login
echo "access_denied" >> smart.login
echo 'printf "\n[Authentication failed for login]"' >> smart.login
echo 'kill -9 $PPID' >> smart.login
echo "fi" >> smart.login
echo "else" >> smart.login
echo 'printf "Enter Password for Login : "' >> smart.login
echo "getPassword" >> smart.login
echo "progress" >> smart.login
echo 'printf "${RED}"' >> smart.login
echo "access_denied" >> smart.login
echo 'printf "\n[Authentication failed for login]"' >> smart.login
echo 'kill -9 $PPID' >> smart.login
echo "fi" >> smart.login
echo "}" >> smart.login
echo "trap '' SIGTSTP" >> smart.login
echo "trap '' SIGINT" >> smart.login
echo "main" >> smart.login

cd /data/data/com.termux/files/usr/bin

echo "getPassword() {" > recent.setup
echo "unset pass" >> recent.setup
echo 'while IFS= read -p "$prompt" -r -s -n 1 char' >> recent.setup
echo "do" >> recent.setup
echo '    if [[ $char == $'"'\0'"' ]] ; then' >> recent.setup
echo "        break" >> recent.setup
echo "    fi" >> recent.setup
echo '    if [[ $char == $'"'\177'"' ]] ; then' >> recent.setup
echo "        prompt=$'\b \b'" >> recent.setup
echo '        pass="${pass%?}"' >> recent.setup
echo "    else" >> recent.setup
echo "        prompt='*'" >> recent.setup
echo '        pass+="$char"' >> recent.setup
echo "    fi" >> recent.setup
echo "done" >> recent.setup
echo "}" >> recent.setup

echo 'printf "Enter Recently Password for New-Setup: "' >> recent.setup
echo "getPassword" >> recent.setup
echo 'if [[ $pass = "'$password'" ]];then' >> recent.setup
echo 'echo -e "\nPassword was Successfully Matched, Now you can Make New-Setup\n"' >> recent.setup
echo "else" >> recent.setup
echo 'echo -e "\nYou entered wrong Password"' >> recent.setup
echo 'echo "Abort."' >> recent.setup
echo "exit 1" >> recent.setup
echo "fi" >> recent.setup
