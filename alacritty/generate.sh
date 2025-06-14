#!/bin/bash
cat fonts.toml >alacritty.toml
echo "" >>alacritty.toml
cat keybindings.toml >>alacritty.toml
echo "" >>alacritty.toml

# set color scheme
cat colors-autumn-kyoto.toml >>alacritty.toml
echo "" >>alacritty.toml

cat window.toml >>alacritty.toml
echo "" >>alacritty.toml
