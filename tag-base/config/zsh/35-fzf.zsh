fzf_preview_command='[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (ccat --color=always {} || highlight -O ansi -l {} || cat {}) 2>/dev/null | head -500'

export FZF_DEFAULT_OPTS="--bind ctrl-e:down,ctrl-u:up --preview \"$fzf_preview_command\""
export FZF_COMPLETION_TRIGGER='\'
export FZF_TMUX_HEIGHT='80%'
export FZF_PREVIEW_COMMAND="$fzf_preview_command"

if command -v ag >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='ag --hidden --ignore .git --ignore-dir=node_modules -g ""'
elif command -v fd >/dev/null 2>&1; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude node_modules'
fi

for fzf_prefix in /opt/homebrew/opt/fzf /usr/local/opt/fzf; do
    if [[ -d "$fzf_prefix" ]]; then
        [[ ":$PATH:" == *":$fzf_prefix/bin:"* ]] || path=($path "$fzf_prefix/bin")
        if [[ -o interactive ]]; then
            [[ -r "$fzf_prefix/shell/completion.zsh" ]] && source "$fzf_prefix/shell/completion.zsh" 2>/dev/null
            [[ -r "$fzf_prefix/shell/key-bindings.zsh" ]] && source "$fzf_prefix/shell/key-bindings.zsh" 2>/dev/null
        fi
    fi
done

[[ -r "$HOME/.fzf.zsh" ]] && source "$HOME/.fzf.zsh"

unset fzf_prefix fzf_preview_command
