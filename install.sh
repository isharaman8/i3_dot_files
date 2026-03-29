#!/bin/bash

# check if you're in arch based
function get-os-name() {
  source /etc/os-release

  local os_name=$NAME

  echo "$os_name"

}

function install-packages() {
  cd ./package-list/ || {
    echo "[ERROR] directory package-list not found exiting"
    exit 1
  }

  [ -f pkglist.txt ] && {
    sudo pacman -Syu --noconfirm
    xargs -a pkglist.txt sudo pacman -S --noconfirm
  }
}

# verify operating system
os_name=$(get-os-name)
echo "${os_name}"

if [[ "${os_name}" != "Arch Linux" ]]; then
  echo "Os Not Supported"
  exit 1
else
  echo "current os supported: moving ahead with the installation"
fi

echo "=> installing pacakages"
cd ./package-list/
