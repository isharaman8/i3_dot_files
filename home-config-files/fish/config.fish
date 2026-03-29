if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch

    # SET VARIABLES
    # set -gx PATH $HOME/.local/bin $PATH

    # source all files in completions
    for f in ~/.config/fish/completions/*.fish
        source $f
    end

    # ABB

end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# OpenClaw Completion
source "/home/amank/.openclaw/completions/openclaw.fish"
export PATH="$HOME/.npm-global/bin:$PATH"
