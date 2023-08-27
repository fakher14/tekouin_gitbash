#!/bin/bash

file="/etc/passwd"

IFS=":"
oldIFS=$IFS
counter=0

while IFS= read -r line
do
   case $counter in 
   0)
   user=$line
   ;;
   3)
   uid=$line
   ;;
   2)
   gid=$line
   ;;
   4)
   comment=$line
   ;;
   5)
   home_directory=$line
   ;;
   6)
   shell=$line
   ;;
   1)
   password=$line
   ;;
   esac
   ((counter++))
done < "$file"
IFS=$oldIFS

echo "The user $user is part of the $gid gang, lives in $home_directory and rides $shell. $uid's place is protected by the passcode $password, more info about the user here: $comment"
