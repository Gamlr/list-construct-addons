#!/bin/bash -e

#addonIDprepare="$(cat *.caproj | grep -oE ".?version[^<>]*>[^<>]+" | cut -d'>' -f2 | head -6 | tail -1)"
addonIDprepare="$(cat *.caproj | grep -oE ".?version[^<>]*>[^<>]+" | cut -d'>' -f2 | sed -n '6 p')"
loopmile="5"
until [[ "$addonIDprepare" = "" ]]
do
   loopmile="$(($loopmile + 1))"
   #echo "Get: $addonIDprepare"
   #echo "Current loop: $loopmile"
   #if [[ "$addonIDprepare" != "" ]]; then echo "Current loop: $loopmile"; else echo "Stopped at loop: $loopmile"; fi
   #if [[ "$addonIDprepare" = "" ]]; then echo "Current loop: $loopmile"; else echo "Stopped at loop: $loopmile"; fi
   #echo "Get: $addonIDprepare"
   #echo "-"
   addonIDprepare="$(cat *.caproj | grep -oE ".?version[^<>]*>[^<>]+" | cut -d'>' -f2 | sed -n "$loopmile p")"
   if [[ "$addonIDprepare" != "" ]]; then echo "Current loop: $loopmile"; else echo "Stopped at loop: $loopmile"; fi
   if [[ "$addonIDprepare" != "" ]]; then echo "Get: $addonIDprepare";echo "-"; fi
done
loopmile="0"
