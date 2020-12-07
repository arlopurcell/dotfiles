# Arlo's Dotfiles

Repository for my dotfiles. works via a bare git repository, adapted from here: https://www.atlassian.com/git/tutorials/dotfiles

## Instructions
* Install requirements below
* clone this repo into a bare git repository: `git clone --bare <git-repo-url> $HOME/.config/dotfile`
* checkout the actual content from the bare repo into your $HOME: `git --git-dir=$HOME/.config/dotfile --work-tree=$HOME" checkout`
* if there's an error message indicating that files will be overwritten, back them up if you want, then remove them and try again
* get the aliases and such: `source ~/.zprofile; source ~/.zshrc`
* tell it to ignore untracked files: `dotfile config --local status.showUntrackedFiles no`
* probably log out and log back in with sway


## Requirements
* zsh (and use chsh to change the default shell)
* neovim 
* sway 
* kitty 
* fzf 
* exa
* bat
* delta (git-delta)
* i3status-rust - https://github.com/arlo/i3status-rust/
* rust - `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
* oh-my-zsh - `sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
* zsh-autosuggestions - `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
* pyenv
** Prerequisites - https://github.com/pyenv/pyenv/wiki/Common-build-problems#prerequisites
** `curl https://pyenv.run | bash`

## Other nice tools
* ranger 
* ripgrep
* fd 
* httpie
