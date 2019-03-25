#!/bin/bash

while :; do
	containers=$(sudo docker ps | awk '{if(NR>1) print $NF}')
	numberofcontainers=0
	adder=1

	for container in $containers
	do
		numberofcontainers=$(python -c "print  $numberofcontainers+$adder")
	done

	echo $numberofcontainers

	if [ $numberofcontainers = 0 ]
	then 
	echo "restart container"
	screen -r -X stuff $'sudo sudo docker run -it -v $(pwd):/createlab -p 8080:80 a4c10351444c --config /createlab/config.json'	
	screen -r "1025.pts-0.instance-1" -X stuff $'ls\n'
	fi

	sleep 30
done
