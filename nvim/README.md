# My Neovim config

## Installation

If you have alread neovim config, make backup

```
mv ~/.config/nvin ~/.config/nvim.bak
```

clean neovim folders 

```
rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.cache/nvim
```

clone the repository directly to `.config` directly

```
git clone https://github.com/lukstep/Dotfiles.git ~/.config/nvim
```

or clone the repository and make symlink

```
git clone https://github.com/lukstep/Dotfiles.git
ln -s ~/Projects/Dotfiles/nvim ~/.config/nvim
```

