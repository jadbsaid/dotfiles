if status is-interactive
    # Commands to run in interactive sessions can go here
end

# go
set -x GOPATH $HOME/go
set -x GOROOT /usr/local/go
set PATH $GOPATH/bin $GOROOT/bin $PATH
