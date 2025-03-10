#!/bin/bash
# set -x
# This is a spicy install script indeed.
# It's actually more for documentation than intended to be run, but is written
# as an install script in hopes that it'll eventually be ready.
# Best not to use it unless you're prepared to deal with installing all the
# necessary tools.
# On a daily driver I prefer stuff to be managed by _something_, so this script
# is biased towards installing millions of package managers as opposed to building
# from source or sourcing binaries.

DISTRO_ID=$( . /etc/os-release && echo $ID )
DISTRO_NAME=$( . /etc/os-release && echo $NAME )
echo "Distribution: $DISTRO_NAME (id: $DISTRO_ID)"

if [ $DISTRO_ID == "ubuntu" ]; then
        sudo apt update
fi

# install brew if needed
which brew
BREW_EXIT_CODE=$?
if [ $BREW_EXIT_CODE -ne 0 && DISTRO_ID == "ubuntu" ]; then
        echo "No brew install found, installing..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)" 
fi
echo "brew is installed"

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

# Install pipx
which pipx
PIPX_EXIT_CODE=$?
if [ $PIPX_EXIT_CODE -ne 0 ]; then
        echo "No pipx install found, installing"
        if [ $DISTRO_ID == 'arch' ]; then
                sudo pacman -S python-pipx
                pipx ensurepath 
        elif [ $DISTRO_ID == 'ubuntu' ]; then
                sudo apt install pipx
                pipx ensurepath
        else
                echo "I don't know how to install pipx on $DISTRO_NAME"
        fi
fi

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
                brew install lua-language-server
        else
                echo "Couldn't install lua-language-server"
        fi
fi

# ripgrep is needed for Mini-Pick to function sensibly
which rg
RG_EXIT_CODE=$?

if [ $RG_EXIT_CODE -ne 0 ]; then
        if [ $DISTRO_ID == "arch" ]; then
                sudo pacman -S ripgrep
        elif [ $DISTRO_ID == "ubuntu" ]; then
                sudo apt install ripgrep
        else
                echo "Couldn't install ripgrep"
        fi
fi

# shellcheck powers bash-language-server
which shellcheck
SHELLCHECK_EXIT_CODE=$?
if [ $SHELLCHECK_EXIT_CODE -ne 0 ]; then
        if [ $DISTRO_ID == "arch" ]; then
                sudo pacman -S shellcheck
        elif [ $DISTRO_ID == "ubuntu" ]; then
                sudo apt install shellcheck
        else
                echo "Couldn't install shellcheck"
        fi
fi

# Finally, some easy setups...
npm install -g pyright > /dev/null
pipx install "python-lsp-server[all]" > /dev/null
echo "Python lsp servers are installed"
npm i -g bash-language-server > /dev/null
echo "Bash language server is installed"
npm i -g prettier > /dev/null
echo "Prettier is installed"
npm i -g vscode-langservers-extracted > /dev/null
echo "vscode-langservers are installed"
npm install -g dockerfile-language-server-nodejs
echo "dockerfile-language-server is installed"
