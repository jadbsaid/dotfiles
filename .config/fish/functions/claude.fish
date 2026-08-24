function claude
    set -l lockfiles ~/.claude/ide/*.lock
    set -l lockfile $lockfiles[1]
    if test -n "$lockfile"
        set -l port (basename $lockfile .lock)
        CLAUDE_CODE_SSE_PORT=$port ENABLE_IDE_INTEGRATION=true command claude $argv
    else
        command claude $argv
    end
end
