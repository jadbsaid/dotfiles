ulimit -n 31415

# Local bin paths
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin

# Theme settings, brighter syntax for Ghostty
set -g fish_color_operator normal
set -g fish_color_redirection normal
set -g fish_color_comment normal
set -g fish_color_valid_path normal
set -g fish_color_cwd normal
set -U fish_color_selection --background=#1f242a --foreground=#e6e1cf

if status is-interactive
end
