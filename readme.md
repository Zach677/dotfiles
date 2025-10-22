# Zach's Dotfiles

### Usage

Install rcm first. then run

```bash
cd
git clone https://github.com/Zach677/dotfiles --depth=1 ~/.dotfiles
rcup -t base
```

After, you will get normal config. (Eg. Tmux, zsh, git ...)

### Mise (tool versions)

Global mise config is tracked at `config/mise/config.toml` and will be linked to `~/.config/mise/config.toml` by rcm.

On a new machine:

```bash
# 1) Install Homebrew (if not installed)
# https://brew.sh

# 2) Install dependencies (rcm + mise, etc.)
brew bundle --file "$HOME/.dotfiles/Brewfile"

# 3) Link dotfiles
rcup -t base

# 4) Ensure shell activation (zsh)
# .zshrc already contains: eval "$(mise activate zsh)"

# 5) Install tool versions from config
mise install
```

Notes:
- Edit global versions in `config/mise/config.toml` and run `mise install` again.
- For strict reproducibility, pin exact versions (e.g. `node = "22.17.0"`) instead of `latest`/`lts`.
- You can also set versions via: `mise use -g node@lts python@3.12`.
