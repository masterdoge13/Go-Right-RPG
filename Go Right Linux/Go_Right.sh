#!/bin/sh
printf '\033c\033]0;%s\a' Go Right
base_path="$(dirname "$(realpath "$0")")"
"$base_path/Go_Right.x86_64" "$@"
