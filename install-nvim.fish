#!/usr/bin/fish

if begin; not command -q pyenv; or not command -q make; or not command -q go; or not command -q lua; end;
    if grep -q 'arch' < /etc/os-release
        sudo pacman -Sy --needed pyenv base-devel go lua
    else
        sudo apt install pyenv build-essentials golang lua
    end
end

echo "INSTALLING NEOVIM"
if grep -q 'arch' < /etc/os-release
    if begin; not command -q wget; or not command -q datediff; or not command -q xmllint; or not command -q curl; end;
        sudo pacman -Sy --needed wget curl dateutils xmllint
    end

    set -l script $HOME/bin/update-neovim-nightly.sh
    mkdir (dirname $script)
    wget "https://gist.githubusercontent.com/ecosse3/ab58a8577d8c69dccdf03304b720e1c8/raw/fc6e03df4c4abd26b0c060c4ea9d7b899ef53087/update-neovim-nightly.sh" -O $script
    chmod +x $script
    yes | $script
else if grep -q 'debian' < /etc/os-release
    sudo add-apt-repository ppa:neovim-ppa/unstable -y
    sudo apt-get update
    sudo apt install neovim -y
end

if not pyenv versions | grep -q nvim
    echo "SETTING UP PYTHON VENV"
    cd ~/.vim
    pyenv virtualenv (pyenv versions --skip-aliases --bare | rg '^3[0-9.]+$' | sort -Vr | head -n 1) nvim
    pyenv activate nvim
    pip install -U pip setuptools pynvim black autopep8 flake8 yapf pylint docutils
    pyenv local nvim
end

echo "SETTING UP CONFIG"

mkdir -p ~/.config/nvim/
ln -sf ~/.vim/.vimrc ~/.vimrc
ln -sf ~/.vim/init.vim ~/.config/nvim/init.vim
ln -sf ~/.vim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -sf ~/.vim/black.toml ~/.config/black
ln -sf ~/.vim/flake8 ~/.flake8
cd

echo "Clean previouse vim environment? " | read answer
if test $answer = "yes" || test $answer = "y" || test -z $answer
    echo "CLEAN VIM ENVIRONMENT"
    rm -rf ~/.vim_runtime/*
    rg --files --no-ignore --hidden | rg '\.viminfo' | xargs rm
end
