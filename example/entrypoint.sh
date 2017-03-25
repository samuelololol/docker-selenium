#!/bin/bash
echo "Starting X virtual framebuffer (Xvfb) in background..."
Xvfb -ac :99 -screen 0 1280x1024x16 &
echo "...done"
export DISPLAY=:99
echo "execute test.py"
python /app/test.py
