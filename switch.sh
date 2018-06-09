#!/usr/bin/bash -eu

# GPIO out
LED=1
AMP=10
gpio mode $LED out # LED
gpio mode $AMP out # amp power

# GPIO in
ONSWITCH=4
MODEBIT1=15
MODEBIT2=16

gpio mode $ONSWITCH up
gpio mode $MODEBIT1 up
gpio mode $MODEBIT2 up

gpio read $ONSWITCH
gpio read $MODEBIT1
gpio read $MODEBIT2

gpio write $LED `gpio read $ONSWITCH`
gpio write $AMP `gpio read $ONSWITCH`
