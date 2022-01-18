#!/usr/bin/fish
cd ~/.vim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt-get update
sudo apt install neovim -y
pyenv virtualenv (pyenv versions --skip-aliases --bare | rg '^3[0-9.]+$' | sort -Vr | head -n 1) nvim
pyenv virtualenv (pyenv versions --skip-aliases --bare | rg '^2[0-9.]+$' | sort -Vr | head -n 1) nvim2
pyenv activate nvim
pip install -U pip setuptools pynvim black autopep8 flake8 yapf pylint
pyenv activate nvim2
pip install -U pip setuptools pynvim
pyenv deactivate
pyenv local nvim
mkdir -p ~/.config/nvim/
ln -sf ~/.vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/.vim/black.toml ~/.config/black
ln -s ~/.vim/flake8 ~/.flake8
cd
rg --files --no-ignore --hidden | rg '\.viminfo' | xargs rm
rm -rf ~/.vim_runtime/*
