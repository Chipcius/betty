#!/bin/bash
if ! [ -x "$(command -v realpath)" ]; then echo "realpath is missing, please install it."; exit 1; fi
if [ -z $BASE_DIR ]; then
	# Set up basic variables
	BASE_DIR=$(realpath $(dirname $(realpath ${BASH_SOURCE[0]})))
	SCRIPTS_DIR="$BASE_DIR/scripts"
fi

# Make sure the base libary is the root dir
cd $BASE_DIR

complete -r betty 2>/dev/null >/dev/null

echo "alias betty=\"$BASE_DIR/main.rb"\"|tee -a ~/.bashrc

complete -o bashdefault -o default -o filenames -o nospace -C $BASE_DIR/autocomplete.rb betty
