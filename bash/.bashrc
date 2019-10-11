#!/bin/bash

[[ $- != *i* ]] && return

. ~/.bash_aliases

BLUE=$'\[\e[34m\]'
RED=$'\[\e[31m\]'
YELLOW=$'\[\e[33m\]'
GREEN=$'\[\e[32m\]'
GREY=$'\[\e[37m\]'
RESET=$'\[\e[0m\]'

export EDITOR=vim
export PAGER=less
export HISTCONTROL=ignoreboth:erasedups
export HISTFILESIZE=10000
export PROMPT_COMMAND='history -a;history -r'

shopt -s histappend

getYoutubePlaylists () {
    input="$HOME/usbdrive/youtube/to_download.txt"
    archive="$HOME/usbdrive/youtube/downloaded.txt"

    while IFS=, read -r col1 col2 col3
    do
        outputDir="$HOME/usbdrive/youtube/$col1/%(uploader)s/%(playlist)s/%(title)s_%(id)s.%(ext)s"
        [ $col2 == "audio" ] && binary="youtube-dl -x --audio-format vorbis" || binary="youtube-dl -f best"
        $binary --download-archive "$archive" -o "$outputDir" -i "$col3"
    done < $input
}

extract () {
   if [ -f $1 ] ; then
       case $1 in
           *.tar.bz2)   tar xvjf $1 && cd $(echo $1 | sed 's/.tar.bz2//')    ;;
           *.tar.gz)    tar xvzf $1 && cd $(echo $1 | sed 's/.tar.gz//')    ;;
           *.bz2)       bunzip2 $1 && cd $(echo $1 | sed 's/.bz2//')    ;;
           *.rar)       unrar x $1 && cd $(echo $1 | sed 's/.rar//')    ;;
           *.gz)        gunzip $1 && cd $(echo $1 | sed 's/.gz//')    ;;
           *.tar)       tar xvf $1 && cd $(echo $1 | sed 's/.tar//')    ;;
           *.tbz2)      tar xvjf $1 && cd $(echo $1 | sed 's/.tbz2//')    ;;
           *.tgz)       tar xvzf $1 && cd $(echo $1 | sed 's/.tgz//')    ;;
           *.zip)       unzip $1 && cd $(echo $1 | sed 's/.zip//')    ;;
           *.Z)         uncompress $1 && cd $(echo $1 | sed 's/.Z//')    ;;
           *.7z)        7z x $1 && cd $(echo $1 | sed 's/.7z//')    ;;
           *)           echo "don't know how to extract '$1'..." ;;
       esac
   else
       echo "'$1' is not a valid file!"
   fi
}

CHAR='>'

export PS1="${GREY}\t ${GREEN}\u${GREY}@${GREEN}\h ${RED}\w${RESET}\n ${CHAR} "
