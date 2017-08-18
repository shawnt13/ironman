#!/usr/bin/env bash

#PreCondtions: MacOS 
#This script is intended to verify the latest version of Adobe Creative Cloud Suite.  
#Create a new document.  Execute a diff command to see if updates are avaiable. 
#Then email it to user. 

name=versionreporting
path=$(dirname "$versionreporting")
filename1="$results"
extension="${versionreporting##*.}"
results="versionreporting.txt"
results2="versionreporting2.txt"
#Timestamp Function 
Timestamp() {
	date +%T
}


sudo /usr/local/bin/RemoteUpdateManager > /private/var/tmp/versionreporting.txt 
Timestamp $path

#echo $results 


if cmp -s /private/var/tmp/versionreporting.txt /private/var/tmp/versionreporting2.txt; then

	echo "no updates"

else

    echo "updates found";

fi 

cp /private/var/tmp/versionreporting.txt /private/var/tmp/versionreporting2.txt

target=$path/$filename.$extension

filename="/private/var/tmp/versionreporting.txt"

/private/var/Shawnt/shawntmail -attach "$filename" -message "`cat $filename`"


exit 0 




# -e $private/var/Shawnt/$versionreporting, $extension