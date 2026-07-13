for local_zsh_config in \
    "$HOME/.local/etc/config.zsh" \
    "$HOME/.local/etc/local.zsh" \
    "$HOME/.zshrc.local"; do
    [[ -r "$local_zsh_config" ]] && source "$local_zsh_config"
done

unset local_zsh_config

[[ -o interactive ]] || return 0

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)
typeset -A ZSH_HIGHLIGHT_STYLES

zsh_syntax_highlighting_file=""
for plugin_file in \
    /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh \
    /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh; do
    if [[ -r "$plugin_file" ]]; then
        source "$plugin_file"
        zsh_syntax_highlighting_file="$plugin_file"
        break
    fi
done

if [[ -z "$zsh_syntax_highlighting_file" ]]; then
    echo "WARN: zsh-syntax-highlighting not found. Run brew bundle --file \"$HOME/.Brewfile\"."
fi

unset plugin_file zsh_syntax_highlighting_file
