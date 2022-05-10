#!/usr/bin/fish
mkdir ~/.vim -p
cd ~/.vim
if command -q pacman
  sudo pacman -Sy neovim nodejs yarn --noconfirm
else
  curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
  sudo apt-get install -y nodejs neovim
end
python3 -m venv venv
source venv/bin/activate.fish
pip install -U pip setuptools pynvim black autopep8 flake8 yapf pylint

mkdir -p ~/.config/nvim/
ln -sf ~/.vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/.vim/black.toml ~/.config/black
ln -sf ~/.vim/flake8 ~/.flake8
ln -sf ~/.vim/.vimrc ~/.vimrc
