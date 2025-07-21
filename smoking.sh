#! /bin/bash

#color banner
CYAN="\e[36m"
YELLOW="\e[33m"
RESET="\e[0m"
RED="\e[31m"
GREEN="\e[32m"

# Printing banner of "SMOKING"
echo -e "${RED}

 ▗▄▄▖▗▖  ▗▖ ▗▄▖ ▗▖ ▗▖▗▄▄▄▖▗▖  ▗▖ ▗▄▄▖
▐▌   ▐▛▚▞▜▌▐▌ ▐▌▐▌▗▞▘  █  ▐▛▚▖▐▌▐▌   
 ▝▀▚▖▐▌  ▐▌▐▌ ▐▌▐▛▚▖   █  ▐▌ ▝▜▌▐▌▝▜▌
▗▄▄▞▘▐▌  ▐▌▝▚▄▞▘▐▌ ▐▌▗▄█▄▖▐▌  ▐▌▝▚▄▞▘
                                     
${CYAN}-----------${YELLOW}SMOKING by ${GREEN}cybercena${CYAN}-----------${RESET}
*note : User must have sudo privileges

"
#adding option for add or edit
while true; do  # adding loop to menupage
echo "Choose an action:"
echo "0) install smokeping"
echo "1) start smokeping & Apache:"
echo "2) Add a Target"
echo "3) Edit the target data"
echo "4) See the Targets list"
echo "5) Restart Smokeping & Apache2 "
echo "6) Stop Smokeping "
echo "7) Stop Apache2"
echo "8) Add new user"
echo "00) clear"
echo "99) Exit"
read -p "Select option : " option

case "$option" in
 0) 
 sudo apt install smokeping 
 ;;

 1)
   sudo systemctl start apache2 && sudo systemctl start smokeping 
   clear
 ;;
 
 2)
  #creating while loop
  clear
  while true; do

    read -e -p "Enter your group name[++ sandesh]: " GROUP

    read -e -p "Enter the menu details: " MENU

    read -e -p "Enter your title: " TITLE

    read -e -p "Enter target IP: " HOST

    payload="
    ++ $GROUP
    menu = $MENU
    title = $TITLE
    host = $HOST
    "
    echo "$payload" >> /etc/smokeping/config.d/Targets
    echo -e "${GREEN}Target successfully added to SmokePing config.${RESET}"

    read -p "Do you want to add another target? (y/n): " add_more
    if [[ "$add_more" != "y" && "$add_more" != "Y" ]]; then
      break
    fi
  done
 ;;

 3)
  clear
  sudo nano /etc/smokeping/config.d/Targets
 ;;

 4)
  clear
  cat /etc/smokeping/config.d/Targets
 ;;

 5)
  sudo systemctl restart smokeping
  sudo systemctl restart apache2
  clear
 ;;

 6) 
  clear
  sudo systemctl stop smokeping
 ;;

 7) 
  clear
  sudo systemctl stop apache2 
 ;;

 99)
 clear && exit
 ;;

 00) clear ;;
esac

done
