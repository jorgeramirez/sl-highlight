#!/bin/bash

# Author: Jorge Ramírez <jorgeramirez1990@gmail.com>

# copy language spec

echo "Install [INIT]"
gtksv=(~/.local/share/gtksourceview-2.0/language-specs ~/.local/share/gtksourceview-3.0/language-specs)

function copy_lang {
    cp sl.lang $1
}

for ((i=0; i < ${#gtksv[@]}; i++)); do
    dir=${gtksv[${i}]}
    if [ ! -d $dir ]; then
        mkdir -p $dir
    fi
    copy_lang $dir
done

# copy mime type spec and update mime types database

mime_dir=~/.local/share/mime/packages

function setup_mime {
    cp sl.xml $mime_dir
    cd ~/.local/share && update-mime-database mime
}

if [ ! -d $mime_dir ]; then
    mkdir -p $mime_dir
fi

setup_mime

echo "Install [DONE]"
