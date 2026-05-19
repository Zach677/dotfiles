alias c='clear'
alias pip='pip3'
alias proxy='export https_proxy=http://127.0.0.1:6152;export http_proxy=http://127.0.0.1:6152;export all_proxy=socks5://127.0.0.1:6153'
alias pc='proxychains4 zsh'
alias cdr='cd $(git rev-parse --show-toplevel)'

alias ga='git status'
alias gc='git clone'
alias gm='git commit -a -m'
alias gpo='git push -u origin $(git symbolic-ref --short HEAD)'
alias gp='git push'
alias gb='git branch'
alias gpl='git pull'
alias gf='git fetch --all --prune'
alias gs='git stash'
alias gr='git rebase'
alias gt='git log --graph --oneline --all'
alias gco='git checkout'
alias gignore='git update-index --assume-unchanged'
alias gnoignore='git update-index --no-assume-unchanged'
alias gclean='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'
alias main='git checkout main || git checkout master'
alias g='lazygit'
alias gm1='git commit -m "chore: update deps"'

alias t='tldr'
alias mkdir='mkdir -p'
alias mkidr='mkdir -p'

alias vf='nvim $(fzf)'
alias cdt='cd $(find * -type d | fzf)'
alias gct='git checkout $(git branch -r | fzf)'

alias cl='cloc . --exclude-dir=node_modules,.nuxt,.next,build,.vscode,dist,release,tmp --exclude-lang=JSON,SVG,XML'

alias r='joshuto'
alias q='exit'
alias ll='ls -l'
alias d='pnpm run dev'

alias tnew='tmux new -s'
alias tkall='tmux kill-session -a'
alias ta='tmux attach-session'
alias yanr='yarn'

alias ss='lsof -Pn -i4 | grep LISTEN'

alias nn='\n'
alias n='pnpm'
alias nenv='export PATH="$PATH:./node_modules/.bin"'
alias clang++='clang++ --std=c++17'
alias g++='g++-13'
alias c++='C++-13'

alias nv='nvim'
alias nvim-dot='NVIM_APPNAME=nvimdots nvim'

alias ghb='gh browse '
alias approve_and_merge_prs="for pr in \$(gh pr list | grep 'renovate' | cut -f1 -d '	'); do gh pr review --approve \$pr && gh pr merge \$pr --auto --squash; done"

alias md='frogmouth '
