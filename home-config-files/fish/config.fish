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
