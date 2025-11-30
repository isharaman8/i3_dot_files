#!/usr/bin/env bash
env >/tmp/rofi-env-from-wrapper.txt
# run the real launcher and capture output
"$HOME/.config/rofi/launchers/type-3/launcher.sh" >>/tmp/rofi-launcher.log 2>&1
