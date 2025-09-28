#!/bin/bash

# Kondwani Mtawali
# 09/28/2025
# Package Update Checker: Scans system for packages that need updates, 
# stores those packages in a list, stores list in a file, automates this process weekely as a cronjob

# NOTE: Script needs to be running as root to access system packages

# Obtains updates for packages
apt-get update -qq # -qq checks for updates quietly 

# Obtain packages that have available updates and writes that list to given directory
apt list --upgradable > ./update-list.txt

# Creating cronjob to execute this task every week[first time program is run, job will be created]
path="/home/kondwani/cs310-package-update-checker/pkg-checker.sh"
if sudo crontab -l 2>/dev/null | grep -F "$path"; then # Checks if cronjob already exists using the path
    echo "Cronjob already exists"
else # If Cronjob doesn't exist, create one that occurs weekly at 2am on Sunday
    echo "0 2 * * 0 $path" | sudo crontab -
fi 




