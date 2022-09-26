#!/usr/bin/env bash
grep -n "# MKHLP:" $1 | cut -d : -f 1 | while read -r helpline ; do
  helpcontent=$(sed "${helpline}q;d" $1 | cut -d " " -f 3-)
  cmdline=$(expr $helpline + 1)
  cmdcontent=$(sed "${cmdline}q;d" $1 | sed 's/://')

  printf "  make %-20s" $cmdcontent
  echo $helpcontent
done
