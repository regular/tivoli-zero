#!/usr/bin/bash -eu

# GPIO out
LED=1
AMP=10
gpio mode $LED out # LED
gpio mode $AMP out # amp power

# GPIO in
ONSWITCH=4
MODEBIT1=16
MODEBIT2=15

gpio mode $ONSWITCH up
gpio mode $MODEBIT1 up
gpio mode $MODEBIT2 up

b0=$(gpio read $ONSWITCH)
b1=$(gpio read $MODEBIT1)
b2=$(gpio read $MODEBIT2)

mode="$b1$b2"
mode_dec=$(echo "$((2#$mode))")
#echo "binary: $mode"
echo "pos: $mode_dec"

current=$(mpc status|head -n -1|tail -n1|cut -d\# -f2|cut -d/ -f1)
if [ -z "$current" ]; then current="9"; fi
echo "curr: $current"

if [ $current -ne $mode_dec -a $b0 -gt 0 ]; then
  mpc  play $mode_dec
fi

mpc status

gpio write $LED $b0
gpio write $AMP $b0
