for local_zsh_config in \
    "$HOME/.local/etc/config.zsh" \
    "$HOME/.local/etc/local.zsh" \
    "$HOME/.zshrc.local"; do
    [[ -r "$local_zsh_config" ]] && source "$local_zsh_config"
done

unset local_zsh_config
