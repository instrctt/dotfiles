if status is-interactive
    if not set -q SSH_AGENT_PID; or not kill -0 $SSH_AGENT_PID 2>/dev/null
        eval (ssh-agent -c | grep -v ^echo)
        set -Ux SSH_AUTH_SOCK $SSH_AUTH_SOCK
        set -Ux SSH_AGENT_PID $SSH_AGENT_PID
        ssh-add ~/.ssh/id_ed25519_instrctt 2>/dev/null
    end
end
