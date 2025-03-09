#!/bin/bash
# set -x
# This is a spicy install script indeed.
# Best not to use it unless you're prepared to deal with installing all the
# necessary tools.

DISTRO_ID=$( . /etc/os-release && echo $ID )
DISTRO_NAME=$( . /etc/os-release && echo $NAME )
echo "Distribution: $DISTRO_NAME (id: $DISTRO_ID)"

if [ $DISTRO_ID == "ubuntu" ]; then
        sudo apt update
fi

# Install npm
which npm
NPM_EXIT_CODE=$?
if [ $NPM_EXIT_CODE -ne 0 ]; then
        echo "No npm install found, installing..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash
        source "$HOME/.nvim/nvm.sh"
        nvm install 22
fi
echo "Npm is installed"

npm i -g prettier > /dev/null
echo "Prettier is installed"
npm i -g vscode-langservers-extracted > /dev/null
echo "vscode-langservers are installed"
# Install cargo
which cargo
CARGO_EXIT_CODE=$?
if [ $CARGO_EXIT_CODE -ne 0 ]; then
        echo "No cargo install found, installing via rustup"
        curl https://sh.rustup.rs -sSf | sh
fi
echo "Cargo is installed"
cargo install --locked --git https://github.com/Feel-ix-343/markdown-oxide.git markdown-oxide 
echo "Markdown-oxide is installed"
# Install clangd

which clangd
CLANGD_EXIT_CODE=$?

if [ $CLANGD_EXIT_CODE -ne 0 ]; then
        if [ $DISTRO_ID == "arch" ]; then
                sudo pacman -S clang
        elif [ $DISTRO_ID == "ubuntu" ]; then
                sudo apt install clang
        else
                echo "Couldn't figure out how to install clangd."
        fi
fi

which lua-language-server
LLS_EXIT_CODE=$?

if [ $LLS_EXIT_CODE -ne 0 ]; then
        if [ $DISTRO_ID == "arch" ]; then
                sudo pacman -S lua-language-server
        elif [ $DISTRO_ID == "ubuntu" ]; then
                sudo apt install lua-language-server
        else
                echo "Couldn't install lua-language-server"
        fi
fi

# Install pyright + python-language-server
npm install -g pyright
pipx install "python-lsp-server[all]"
