#!/bin/bash

pactl set-sink-mute @DEFAULT_SINK@ toggle
s=$(pactl get-default-sink)
for i in $(pactl list short sinks | cut -f2 | grep -v $s); do
  pactl set-sink-mute $i 1
done
