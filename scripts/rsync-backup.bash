#!/bin/bash

#sudo -i -u khunbai bash << EOF
#echo "== Rsync between /home/khunbai/01-dev_projects and /home/khunbai/vm_shares/shared/01-shared_dropbox/01-dev_projects"
#rsync -avu --delete "/home/khunbai/01-dev_projects/" "/home/khunbai/vm_shares/shared/01-shared_dropbox/01-dev_projects"
#EOF


echo "== Rsync between /home/khunbai/01-dev_projects and /home/khunbai/vm_shares/shared/01-shared_dropbox/01-dev_projects"
rsync -au --stats --delete --exclude={"node_modules/",".vscode/",".angular/"} "/home/khunbai/01-dev_projects/" "/home/khunbai/vm_shares/shared/01-shared_dropbox/01-dev_projects"


