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
rm -rf ~/.zshrc
ln -s $PWD/.zshrc $HOME/.zshrc

# Nvim config
ln -s $PWD/nvim/ $HOME/.config/nvim

# Htop config
ln -s $PWD/htop/ $HOME/.config/htop

# Homebrew install
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install package using brew
brew bundle install

# Download iterm2 themes
wget https://raw.githubusercontent.com/rebelot/kanagawa.nvim/master/extras/kanagawa_dragon.itermcolors
wget https://github.com/rebelot/kanagawa.nvim/blob/master/extras/kanagawa.itermcolors

# Wezterm config
ln -s $PWD/.wezterm.lua $HOME/.wezterm.lua
