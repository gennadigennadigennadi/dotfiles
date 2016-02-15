#!/bin/bash

cd "$(dirname "${BASH_SOURCE}")" && source "utils.sh"

declare -a FILES_TO_SYMLINK=(
    "config"
    "zprezto"
    "zprezto/runcoms/zshrc"
    "zprezto/runcoms/zpreztorc"
    "zprezto/runcoms/zprofile"
    "zprezto/runcoms/zlogin"
    "zprezto/runcoms/zlogout"
    "zprezto/runcoms/zshenv"

    "git/gitconfig"
    "git/gitignore"
    "git/gitignore_global"

    "vim/vim"
    "vim/vimrc"

    "nvim/nvimrc"

)

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

main() {

    local i=""
    local sourceFile=""
    local targetFile=""

    for i in ${FILES_TO_SYMLINK[@]}; do

        sourceFile="$(cd .. && pwd)/$i"
        targetFile="$HOME/.$(printf "%s" "$i" | sed "s/.*\/\(.*\)/\1/g")"

        if [ -e "$targetFile" ]; then
            if [ "$(readlink "$targetFile")" != "$sourceFile" ]; then

                ask_for_confirmation "'$targetFile' already exists, do you want to overwrite it?"
                if answer_is_yes; then
                    rm -rf "$targetFile"
                    execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
                else
                    print_error "$targetFile → $sourceFile"
                fi

            else
                print_success "$targetFile → $sourceFile"
            fi
        else
            execute "ln -fs $sourceFile $targetFile" "$targetFile → $sourceFile"
        fi

    done

}

main