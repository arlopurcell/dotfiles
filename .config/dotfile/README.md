Repository for my dotfiles. works via a bare git repository, adapted from here: https://www.atlassian.com/git/tutorials/dotfiles
In short, 
* create this alias `alias dotfile="/usr/bin/git --git-dir=$HOME/.config/dotfile/repo --work-tree=$HOME"` 
* clone this repo into a bare git repository: `git clone --bare <git-repo-url> $HOME/.config/dotfile`
* checkout the actual content from the bare repo into your $HOME: `dotfile checkout`
* if there's an error message indicating that files will be overwritten, back them up if you want, then remove them and try again
* tell it to ignore untracked files: `dotfile config --local status.showUntrackedFiles no`

Also the following should be installed for optimal configuration pleasure:

* package manager
** zsh
** neovim
** ranger
** conky
** i3
* Custom install 
** fd
** pyenv
** exa
** oh-my-zsh
** fzf
** kitty
** zsh-autosuggestions
