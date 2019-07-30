#!/usr/bin/bash
echo "Executing the mount-and-share.sh script"
echo "Script that mount an USB drive and others an share them "
echo "Heavily inspired from the excellent https://github.com/janvda/balena-samba-rsync\n"

# Mounting external drive if appropriate device service variables are set.
if [ "$ext_dev_partition1" != '' -a "$ext_mnt_partition1" != ''  ]; then
   echo "STEP 1: Mounting external device partition: $ext_dev_partition1 at $ext_mnt_partition1 ...."
   mkdir -p $ext_mnt_partition1
   mount $ext_dev_partition1 $ext_mnt_partition1
   echo "Mounted successfully....listing file in mounted directory"
   echo -e "******* Filesystem Statistics ******************************"
   df -h
   echo -e "************************************************************\n"
   
   #Changing files right ... to avoid acces denied just in case
   chmod 766 -R $ext_mnt_partition1 
   chown root:root -R $ext_mnt_partition1       
   
   echo -e "******* Listing $ext_mnt_partition1  root content ************"
   ls -lh $ext_mnt_partition1    
   echo -e "************************************************************\n"
fi 


echo -e "Service ready to serve and sleeping forever...."
while true; do
   # every hour a "zzz" is put into the log files.
   echo "Sleeping for ten more hours"
   sleep 36000
done
echo "Exiting....."
