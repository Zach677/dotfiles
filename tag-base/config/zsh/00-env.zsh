VISUAL=nvim
export VISUAL EDITOR=nvim
export EDITOR

export LSCOLORS=exfxcxdxbxexexxxxxxxxx
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US

export STARSHIP_LOG=error
export CLAUDE_CODE_NO_FLICKER=1

_INIT_SH_NOFUN=1

if command -v tty >/dev/null 2>&1 && [[ -t 0 ]]; then
    export GPG_TTY="$(tty)"
fi

bitwarden_ssh_sock="$HOME/Library/Containers/com.bitwarden.desktop/Data/.bitwarden-ssh-agent.sock"
if [[ -S "$bitwarden_ssh_sock" ]]; then
    export SSH_AUTH_SOCK="$bitwarden_ssh_sock"
    command -v launchctl >/dev/null 2>&1 && launchctl setenv SSH_AUTH_SOCK "$SSH_AUTH_SOCK" >/dev/null 2>&1
fi

unset bitwarden_ssh_sock
