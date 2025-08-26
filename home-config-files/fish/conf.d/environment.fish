#UNIVERSAL VARIABLES
set -Ux ANDROID_HOME $HOME/Android/Sdk
set -Ux EDITOR nvim
set -Ux VISUAL nvim

# GLOBAL VARIABLES
set -gx PATH $HOME/Android/Sdk/emulator $HOME/Android/Sdk/platform-tools $HOME/.local/bin $HOME/bin $PATH
