#!/bin/sh

run_lamp_dev=/dev/gpioc1
run_lamp_pin=29

gpio_setup() {
	gpioctl -f ${run_lamp_dev} -c ${run_lamp_pin} OUT
}

run_lamp_on() {
	gpioctl -f ${run_lamp_dev} ${run_lamp_pin} 1
}

run_lamp_off() {
	gpioctl -f ${run_lamp_dev} ${run_lamp_pin} 0
}

run_lamp_loop() {
	while true
	do
		run_lamp_on
		sleep 1
		run_lamp_off
		sleep 1
	done
}

gpio_setup
run_lamp_loop &
