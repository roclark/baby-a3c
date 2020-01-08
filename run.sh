#!/bin/bash
python3 baby-a3c.py &

until ps aux | grep -i "[x]vfb" > /dev/null; do
    sleep 1
done

x11vnc -display :0 -forever -viewonly -rfbport 5900 -shared &
