#!/bin/sh

GPIO_25="25"
GPIO_26="26"
GPIO_27="27"

GPIO25_PATH="/sys/class/gpio/gpio25/"
GPIO26_PATH="/sys/class/gpio/gpio26/"
GPIO27_PATH="/sys/class/gpio/gpio27/"

COUNTER=1

# Check if the GPIO directories exist; if not 

if [ ! -e $GPIO25_PATH ] || [ ! -e $GPIO26_PATH ] || [ ! -e $GPIO27_PATH ]; then
        
        echo $GPIO_25 > /sys/class/gpio/export
        echo "out" > /sys/class/gpio/gpio25/direction
        
        # export pin to userspace
        echo $GPIO_26 > /sys/class/gpio/export
        echo "out" > /sys/class/gpio/gpio26/direction

        #export pin to userspace
        echo $GPIO_27 > /sys/class/gpio/export
        echo "out" > /sys/class/gpio/gpio27/direction
fi


echo "out" > /sys/class/gpio/gpio25/direction
echo "out" > /sys/class/gpio/gpio26/direction
echo "out" > /sys/class/gpio/gpio27/direction

# Run loop ten times

while [ $COUNTER -le 10 ]; do

        # set pin 25 high
        echo "1" > /sys/class/gpio/gpio25/value
        sleep 1
        # set pin 25 low
        echo "0" > /sys/class/gpio/gpio25/value

        # set pin 26 high
        echo "1" > /sys/class/gpio/gpio26/value
        sleep 1
        # set pin 26 low
        echo "0" > /sys/class/gpio/gpio26/value

        # set pin 27 high
        echo "1" > /sys/class/gpio/gpio27/value
        sleep 1
        # set pin 27 low
        echo "0" > /sys/class/gpio/gpio27/value
        COUNTER=$(( $COUNTER + 1 ))
done