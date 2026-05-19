[[ -o interactive ]] || return 0

if command -v mise >/dev/null 2>&1; then
    eval "$(mise activate zsh 2>/dev/null)"
fi

if command -v zoxide >/dev/null 2>&1; then
    eval "$(zoxide init zsh 2>/dev/null)"
fi

if command -v thefuck >/dev/null 2>&1; then
    eval "$(thefuck --alias 2>/dev/null)"
fi

if command -v starship >/dev/null 2>&1; then
    eval "$(starship init zsh 2>/dev/null)"
fi

[[ -r "$HOME/.config/tabtab/zsh/__tabtab.zsh" ]] && source "$HOME/.config/tabtab/zsh/__tabtab.zsh" || true

if [[ "$TERM_PROGRAM" == "kiro" ]] && command -v kiro >/dev/null 2>&1; then
    kiro_shell_integration="$(kiro --locate-shell-integration-path zsh 2>/dev/null)"
    [[ -r "$kiro_shell_integration" ]] && source "$kiro_shell_integration"
fi

unset kiro_shell_integration
