if [ -e "${HOME}/.profile" ]; then
    source "${HOME}/.profile"
fi

case `uname` in
  Linux)
    setxkbmap -option ctrl:swapcaps
  ;;
esac
