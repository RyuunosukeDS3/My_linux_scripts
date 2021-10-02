#!/bin/sh

pacmd set-default-source 4
pactl load-module module-loopback latency_msec=1 source_dont_move=1
pacmd set-default-source 18