#!/bin/bash

for i in ~/dotfiles/* ; do
    if [ -d $i ]; then
        echo $(basename "$i")
        stow $(basename "$i")
    fi
done
