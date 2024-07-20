ulimit -n 31415

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# go
fish_add_path (go env GOPATH)/bin

# python
set -xg PYTHONPATH /opt/homebrew/bin/python3 $PYTHONPATH
alias python="/opt/homebrew/bin/python3"
set -gx PATH /opt/homebrew/bin $PATH
