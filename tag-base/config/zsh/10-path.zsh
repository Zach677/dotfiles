typeset -U path PATH

path=(
    "$HOME/.local/bin"
    /opt/homebrew/bin
    /opt/homebrew/sbin
    /opt/homebrew/opt/openjdk/bin
    /opt/homebrew/opt/curl/bin
    /opt/homebrew/opt/llvm/bin
    /opt/homebrew/opt/qt@5/bin
    $path
)
