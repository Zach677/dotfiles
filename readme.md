# Zach's Dotfiles

Personal macOS configuration managed with [rcm](https://github.com/thoughtbot/rcm).

## Ownership

- rcm links files from `tag-base/` into `$HOME`.
- Homebrew manages applications and system tools from `tag-base/Brewfile`.
- mise manages language runtimes from `tag-base/config/mise/config.toml`.
- Machine-only shell configuration belongs in `~/.zshrc.local`.

## Bootstrap

Install [Homebrew](https://brew.sh), then run:

```bash
git clone https://github.com/Zach677/dotfiles.git "$HOME/.dotfiles"
"$HOME/.dotfiles/macos-setup.sh"
```

The setup script applies the tracked macOS preferences, installs the Brewfile,
links the `base` tag, and installs the configured mise runtimes. It intentionally
disables disk image verification and reveals Gatekeeper's `Anywhere` option;
select `Anywhere` in System Settings > Privacy & Security after setup. SSH keys
come from Bitwarden: sign in and enable its SSH Agent after installation. SSH
host configuration remains outside this repository and must be restored
separately.

Restore the default verification policy with:

```bash
defaults delete com.apple.frameworks.diskimages skip-verify
defaults delete com.apple.frameworks.diskimages skip-verify-locked
defaults delete com.apple.frameworks.diskimages skip-verify-remote
sudo spctl --global-enable
```

## Daily workflow

Preview and apply dotfile changes:

```bash
lsrc -v
rcup -v
```

Check package drift without installing or removing anything:

```bash
brew bundle check --verbose --file "$HOME/.Brewfile"
mise outdated
```

Run the local checks after editing shell or bootstrap files:

```bash
shellcheck macos-setup.sh
zsh -n tag-base/zshrc tag-base/config/zsh/*.zsh
```

RCM is intentionally retained for its small symlink-and-tag model. Revisit the
choice when this repository needs templates, secret management, or real
per-machine configuration instead of adding those features speculatively.
