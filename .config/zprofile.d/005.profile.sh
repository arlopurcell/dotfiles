if [ -e "${HOME}/.profile" ]; then
    source "${HOME}/.profile"
fi

setxkbmap -option ctrl:swapcaps
