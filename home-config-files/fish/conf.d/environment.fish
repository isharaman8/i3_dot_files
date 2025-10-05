#UNIVERSAL VARIABLES
set -Ux ANDROID_HOME $HOME/Android/Sdk
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# GLOBAL VARIABLES
set -gx PATH $HOME/Android/Sdk/emulator $HOME/Android/Sdk/platform-tools $HOME/.local/bin $HOME/bin $PATH
set -gx XDG_DATA_DIRS /usr/share:/usr/local/share:$XDG_DATA_DIRS
