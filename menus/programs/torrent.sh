#!/bin/bash
#
# [PlexGuide Menu]
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 - Deiteq
# URL:      https://plexguide.com
#
# PlexGuide Copyright (C) 2018 PlexGuide.com
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################
export NCURSES_NO_UTF8_ACS=1
echo 'INFO - @Main Torrent Program Menu' > /var/plexguide/pg.log && bash /opt/plexguide/scripts/log.sh

 HEIGHT=12
 WIDTH=38
 CHOICE_HEIGHT=6
 BACKTITLE="Visit PlexGuide.com - Automations Made Simple"
 TITLE="Applications - Torrent Programs"

 OPTIONS=(A "qBittorrent"
          B "RuTorrent"
          C "Deluge"
          D "Jackett"
          E "VPN Options"
          Z "Exit")

 CHOICE=$(dialog --backtitle "$BACKTITLE" \
                 --title "$TITLE" \
                 --menu "$MENU" \
                 $HEIGHT $WIDTH $CHOICE_HEIGHT \
                 "${OPTIONS[@]}" \
                 2>&1 >/dev/tty)

case $CHOICE in

    A)
        display=qBittorrent
        program=qbittorrent
        echo "$program" > /tmp/program_var
        dialog --infobox "Installing: $display" 3 30
        sleep 2
        clear
        port=8080
        ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags qbittorrent
        read -n 1 -s -r -p "Press any key to continue"
             echo "$program" > /tmp/program
             echo "$program" > /tmp/program_var
             echo "$port" > /tmp/port
             bash /opt/plexguide/menus/time/cron.sh
             bash /opt/plexguide/menus/programs/ending.sh
        ;;

     B)
       display=RUTorrent
       program=rutorrent
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       sleep 2
       clear
       port=8999
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags rutorrent
       read -n 1 -s -r -p "Press any key to continue"
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     C)
       display=Deluge
       program=deluge
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       sleep 2
       clear
       port=8112
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags deluge
       read -n 1 -s -r -p "Press any key to continue"
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     D)
       display=Jackett
       program=jackett
       echo "$program" > /tmp/program_var
       dialog --infobox "Installing: $display" 3 30
       sleep 2
       clear
       port=9117
       ansible-playbook /opt/plexguide/ansible/plexguide.yml --tags jackett
       read -n 1 -s -r -p "Press any key to continue"
            echo "$program" > /tmp/program
            echo "$program" > /tmp/program_var
            echo "$port" > /tmp/port
            bash /opt/plexguide/menus/time/cron.sh
            bash /opt/plexguide/menus/programs/ending.sh
       ;;

     E)
       bash /opt/plexguide/menus/programs/vpn.sh ;;

     Z)
       exit 0 ;;
esac

#### recall itself to loop unless user exits
bash /opt/plexguide/menus/programs/torrent.sh
