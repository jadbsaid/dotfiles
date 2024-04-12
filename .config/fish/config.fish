ulimit -n 31415

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# go
fish_add_path (go env GOPATH)/bin
