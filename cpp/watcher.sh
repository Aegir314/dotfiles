#!/bin/bash
while true
do
    inotifywait -e modify $1 && make
done
