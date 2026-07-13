if [[ -d "$HOME/.zsh/completions" ]]; then
    fpath=("$HOME/.zsh/completions" $fpath)
fi

for completion_dir in \
    /opt/homebrew/share/zsh-completions \
    /usr/local/share/zsh-completions; do
    [[ -d "$completion_dir" ]] && fpath=("$completion_dir" $fpath)
done

for git_extras_completion in \
    /opt/homebrew/opt/git-extras/share/git-extras/git-extras-completion.zsh \
    /usr/local/opt/git-extras/share/git-extras/git-extras-completion.zsh; do
    [[ -r "$git_extras_completion" ]] && source "$git_extras_completion"
done

if [[ -o interactive ]]; then
    autoload -Uz compinit
    compinit -i
fi

unset completion_dir git_extras_completion
