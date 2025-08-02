#!/bin/bash

pactl set-sink-volume @DEFAULT_SINK@ $1

v=$(pactl get-sink-volume @DEFAULT_SINK@ | sed -n 's/^.* \([0-9]\{1,3\}\)% .*$/\1/p')
if expr $v % 5; then
  v=$(expr $v + \( 5 - $v % 5 \))
  pactl set-sink-volume @DEFAULT_SINK@ $v%
fi

for i in $(pactl list short sinks | cut -f2); do
  pactl set-sink-volume $i $v%
done
