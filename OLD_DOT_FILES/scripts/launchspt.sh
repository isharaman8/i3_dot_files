#!/bin/sh

if [ ! $(prep "spotifyd") ]; then
	spotifyd
fi
spt
