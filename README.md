# tivoli-zero

## Wiring


### Raspberry PI GPIO Pin Header

```
   3.3v   1 o o 2   5V
  BCM 2   3 o x 4   5V
  BCM 3   5 o x 6   GND
  BCM 4   7 o x 8   BCM 14    mode bit 1        WP 15 in (pull up)
    GND   9 o x 1   BCM 15    mode bit 2        WP 16 in (pull up)
 BCM 17  11 o x 12  BCM 18    front panel LED   WP 1  out

 BCM 27  13 o o 14  GND
 BCM 22  15 o x 16  BCM 23    on switch         WP 4  in (pull up)
   3.3v  17 R o 18  BCM 24
 BCM 10  19 R o 20  GND
  BCM 9  21 R R 22  BCM 25    rfm12b
 BCM 11  23 R x 24  BCM 8     amp power supply  WP 8  out
    GND  25 R R 26  BCM 7

  BCM 0  27 o o 28  BCM 1
  BCM 5  29 o o 30  GND
  BCM 6  31 o o 32  BCM 12
 BCM 13  33 o o 34  GND
 BCM 19  35 o o 36  BCM 16
 BCM 26  37 o o 38  BCM 20
    GND  39 o o 40  BCM 21
```

### pre-amp board
#### J1

```
  o 1   L out --> front pnael volume knob (?)
  o 2   R out --> front pnale Volume knob (?)
  o 3   L in  <-- USB audio
  o 4   R in  <-- USB audio
  o 5   R     <-- front panel volume knob (?)
  o 6   L     <-- front panel volume knob (?)  
  o 7   GND   --- USB Audio
  o 8   Aux R
  o 9   Aux L
  o 10  GND    --> Relay switch o  o
  o 11  +8V                      \=== --> BCM 8  
  o 12  on/off --> Relay switch   o (default to GND)
```

### front panel board
#### J1

```
  o 1   L out --> volume knob (?)
  o 2   R out --> Volume knob (?)
  o 3   L in  
  o 4   R in  
  o 5   R     <-- volume knob (?)
  o 6   L     <-- volume knob (?)  
  o 7   GND  
  o 8   Aux R
  o 9   Aux L
  o 10  GND   --> pre-amp board/raspi
  o 11  +8V   --> pre-amp board
  o 12  power switch (GND when off) --> BCM 23
```

#### J2
  
```
  o 1   --> T1 C
  o 2   --> mode bit 1  BCM 14
  o 3   --> mode bit 2  BCM 15
```

```
  /  T1 C  --> J2.1 (front panel LED)
[)-  T1 B  --[ R1 ]-- <-- BCM 18 (control front panel LED)
  \  T1 E  -- GND
```
