[[ -o interactive ]] || return 0

# Antigen: https://github.com/zsh-users/antigen
ANTIGEN=""
for antigen_file in \
    "$HOME/.local/bin/antigen.zsh" \
    /opt/homebrew/opt/antigen/share/antigen/antigen.zsh \
    /usr/local/opt/antigen/share/antigen/antigen.zsh; do
    if [[ -r "$antigen_file" ]]; then
        ANTIGEN="$antigen_file"
        break
    fi
done

if [[ -z "$ANTIGEN" ]]; then
    echo "WARN: antigen.zsh not found. Run brew bundle from ~/.dotfiles."
    unset antigen_file
    return 0
fi

source "$ANTIGEN"

antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES

antigen apply

unset antigen_file
