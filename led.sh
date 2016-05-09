#!/bin/sh

GPIO_25="25"
GPIO_26="26"
GPIO_27="27"

COUNTER=1

echo $GPIO_25 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio25/direction

# export pin to userspace
echo $GPIO_26 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio26/direction

# export pin to userspace
echo $GPIO_27 > /sys/class/gpio/export
echo "out" > /sys/class/gpio/gpio27/direction


while [ $COUNTER -le 10 ]; do

        # set pin 25 high
        echo "1" > /sys/class/gpio/gpio25/value
        sleep 1
        # set pin 25 low
        echo "0" > /sys/class/gpio/gpio25/value

        # set pin 26 high
        echo "1" > /sys/class/gpio/gpio26/value
        sleep 1
        # set pin 25 low
        echo "0" > /sys/class/gpio/gpio26/value

        # set pin 27 high
        echo "1" > /sys/class/gpio/gpio27/value
        sleep 1
        # set pin 25 low
        echo "0" > /sys/class/gpio/gpio27/value
        COUNTER=$(( $COUNTER + 1 ))
done