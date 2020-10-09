#!/usr/bin/bash

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
