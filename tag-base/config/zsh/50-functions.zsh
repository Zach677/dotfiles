pouptmux() {
    local width="${1:-80%}"
    local height="${2:-80%}"

    if [[ "$(tmux display-message -p -F "#{session_name}")" = "popup" ]]; then
        tmux detach-client
    else
        tmux popup -d '#{pane_current_path}' -xC -yC -w"$width" -h"$height" -E "tmux attach -t popup || tmux new -s popup"
    fi
}

ghfl() {
    gh api /user --jq '"@" + .login + " has " + (.followers|tostring) + " followers!"'
}

nvims() {
    local items config
    items=("default" "nvim-dot" "xloby_nvim")
    config=$(printf "%s\n" "${items[@]}" | fzf --prompt="Neovim Config >" --height=~50% --layout=reverse --border --exit-0)

    if [[ -z "$config" ]]; then
        echo "Nothing selected"
        return 0
    elif [[ "$config" == "default" ]]; then
        config=""
    fi

    NVIM_APPNAME="$config" nvim "$@"
}

gi() {
    local query="${(j:,:)@}"
    curl -sLw "\n" "https://www.toptal.com/developers/gitignore/api/$query"
}
