function claude
    set -l lockfile (ls ~/.claude/ide/*.lock 2>/dev/null | head -1)
    if test -n "$lockfile"
        set -l port (basename $lockfile .lock)
        CLAUDE_CODE_SSE_PORT=$port ENABLE_IDE_INTEGRATION=true command claude $argv
    else
        command claude $argv
    end
end
