if status is-interactive
    # Commands to run in interactive sessions can go here
    neofetch

    # SET VARIABLES
    set -gx PATH $HOME/.local/bin $PATH

    # ABBREVATIONS file path
    source ~/.config/fish/completions/abbr.fish

end
