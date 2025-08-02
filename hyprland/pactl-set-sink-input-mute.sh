#!/bin/bash

for i in $(pactl list short sink-inputs | cut -f1); do
  pactl set-sink-input-mute $i $1
done
