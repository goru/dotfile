#!/bin/bash

s=$(pactl get-default-sink)
n=$((pactl list short sinks; pactl list short sinks) | cut -f2 | grep -m1 -A1 $s | tail -n1)
pactl set-sink-mute @DEFAULT_SINK@ 1
pactl set-default-sink $n
pactl set-sink-mute @DEFAULT_SINK@ 0

for i in $(pactl list short sink-inputs | cut -f1); do
  pactl move-sink-input $i $n
done
