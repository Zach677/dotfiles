[[ -o interactive ]] || return 0

zsh_autosuggestions_file=""
for plugin_file in \
    /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh \
    /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh; do
    if [[ -r "$plugin_file" ]]; then
        source "$plugin_file"
        zsh_autosuggestions_file="$plugin_file"
        break
    fi
done

if [[ -z "$zsh_autosuggestions_file" ]]; then
    echo "WARN: zsh-autosuggestions not found. Run brew bundle --file \"$HOME/.Brewfile\"."
fi

unset plugin_file zsh_autosuggestions_file
