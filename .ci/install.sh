#!/bin/bash

set -e
set -x

if [[ "$(uname -s)" == 'Darwin' ]]; then
    time brew update || time brew update
    time brew outdated pyenv || time brew upgrade pyenv
    time brew install pyenv-virtualenv
    time brew install cmake || true

    if which pyenv > /dev/null; then
        eval "$(pyenv init -)"
    fi

    time pyenv install 3.7.1
    time pyenv virtualenv 3.7.1 conan
    time pyenv rehash
    time pyenv activate conan
fi

time pip install conan --upgrade
time pip install conan_package_tools bincrafters_package_tools

conan user
