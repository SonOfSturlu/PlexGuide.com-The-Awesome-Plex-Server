#!/bin/bash
#
# GitHub:   https://github.com/Admin9705/PlexGuide.com-The-Awesome-Plex-Server
# Author:   Admin9705 & Deiteq & FlickerRate
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

######################################################## Declare Variables
sname="PG Installer: Alias Install"
pg_alias=$( cat /var/plexguide/pg.alias )
pg_alias_stored=$( cat /var/plexguide/pg.alias.stored )
######################################################## START: PG Log
sudo echo "INFO - Start of Script: $sname" > /var/plexguide/pg.log
sudo bash /opt/plexguide/roles/log/log.sh
######################################################## START: Main Script
if [ "$pg_alias" == "$pg_alias_stored" ]; then
      echo "" 1>/dev/null 2>&1
    else
      echo "Installing Alias Commands" > /var/plexguide/message.phase
      bash /opt/plexguide/menu/interface/install/scripts/message.sh
      ansible-playbook /opt/plexguide/menu/interface/alias/main.yml
      cat /var/plexguide/pg.alias > /var/plexguide/pg.alias.stored
  fi
######################################################## END: Main Script
#
#
######################################################## END: PG Log
sudo echo "INFO - END of Script: $sname" > /var/plexguide/pg.log
sudo bash /opt/plexguide/roles/log/log.sh
