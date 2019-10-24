Repository for my dotfiles. works via a bare git repository, adapted from here: https://www.atlassian.com/git/tutorials/dotfiles
In short, 
* create this alias `alias dotfile="/usr/bin/git --git-dir=$HOME/.config/dotfile/repo --work-tree=$HOME"` 
* clone this repo into a bare git repository: `git clone --bare <git-repo-url> $HOME/.config/dotfile`
* checkout the actual content from the bare repo into your $HOME: `dotfile checkout`
* if there's an error message indicating that files will be overwritten, back them up if you want, then remove them and try again
* tell it to ignore untracked files: `dotfile config --local status.showUntrackedFiles no`

Also the following should be installed for optimal configuration pleasure:

`sudo apt-get install zsh neovim ranger conky i3 fd-find`
pyenv - `curl https://pyenv.run | bash`
oh-my-zsh - `sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"`
kitty - `curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin`
zsh-autosuggestions - `git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions`
fzf - `git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install`

Other stuff I usually install:
rust - `curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh`
exa - once rust is installed: `cargo install exa`
ripgrep - once rust is installed: `cargo install ripgrep`
