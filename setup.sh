# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k

# Make .zshrc backup and simlink
mv ~/.zshrc ~/.zshrc.bak
ln -s $PWD/.zshrc $HOME/.zshrc

# Nvim config
ln -s $PWD/nvim/ $HOME/.config/nvim

# htop config
ln -s $PWD/htop/ $HOME/.config/htop

# Homebrew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install package using brew
brew tap homebrew/cask-fonts
brew install --cask font-victor-mono-nerd-font iterm2 miniconda
brew install fzf ripgrep neovim tmux tree-sitter htop tig conda-zsh-completion wget

# Download iterm2 themes
wget https://raw.githubusercontent.com/rebelot/kanagawa.nvim/master/extras/kanagawa_dragon.itermcolors
wget https://github.com/rebelot/kanagawa.nvim/blob/master/extras/kanagawa.itermcolors
