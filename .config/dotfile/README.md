# Arlo's Dotfiles

Repository for my dotfiles. works via a bare git repository, adapted from here: https://www.atlassian.com/git/tutorials/dotfiles

## Instructions
* Install requirements below
* clone this repo into a bare git repository: `git clone --bare git@github.com:arlopurcell/dotfiles.git $HOME/.config/dotfile`
* checkout the actual content from the bare repo into your $HOME: `git --git-dir=$HOME/.config/dotfile --work-tree="$HOME" checkout`
* if there's an error message indicating that files will be overwritten, back them up if you want, then remove them and try again
* get the aliases and such: `source ~/.zprofile; source ~/.zshrc`
* tell it to ignore untracked files: `dotfile config --local status.showUntrackedFiles no`
* probably log out and log back in with i3


## Requirements
* zsh (and use chsh to change the default shell)
* neovim 
* vim-plug - `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
* i3 
* i3lock
* xautolock
* kitty 
* fzf 
* exa
* bat
* delta (git-delta)
* i3status-rust - https://github.com/arlopurcell/i3status-rust/
* rust - `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
* oh-my-zsh - `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
* zsh-autosuggestions - `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
* zsh-syntax-highlighting - `git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting`
* powerlevel10k theme - `git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k`
* nvm `curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash`
* pyenv
** Prerequisites - https://github.com/pyenv/pyenv/wiki#suggested-build-environment
** `curl https://pyenv.run | bash`
** create neovim virtualenv

## Other nice tools
* ranger 
* ripgrep
* fd 
* httpie
