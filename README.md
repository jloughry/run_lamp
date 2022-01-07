# run_lamp: utilities to control GPIO pins on BeagleBone Black under FreeBSD-13

This makes an LED connected to a BeagleBone flash slowly on and off whenever
the OS is running.

There is an LED (with a 470 ohm current-limiting resistor in series) connected
from physical pin 26 on header P8 on the BeagleBone to physical pin 2 on P8
which is ground. To turn the LED on:

```
sudo gpioctl -f /dev/gpioc1 -c 29 OUT
sudo gpioctl -f /dev/gpioc1 29 1
```

How you get the numbers "gpioc1" and "29" from physical pin 26 on header P8 on
the BeagleBone Black is by looking at Table 10 in the *BeagleBone Black System
Reference Manual* and finding pin 26; it says its name is `GPIO1_29` and that
gives you the numbers you need to feed to `gpioctl(8)` when running under
FreeBSD 13.

`/etc/rc.d/run_lamp` should have permissions `-r-xr-xr-x` and owned by root:wheel

`/usr/local/bin/run_lamp.sh` should have permissions `-rwxr--r--`

Add the following line to the /etc/rc.conf file:

```
run_lamp_enable="YES"
```

