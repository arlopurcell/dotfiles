export PATH="$HOME/bin:$HOME/.cargo/bin:$PATH"
export EDITOR=nvim
export JAVA_HOME=/usr/java/jdk1.8.0_202

# Single-brace syntax because this is required in bash, dash, zsh, etc
if [ -e "$HOME/env/etc/indeed_profile" ]; then
    . "$HOME/env/etc/indeed_profile"
fi

# OPTIONAL, but recommended: Add ~/env/bin to your PATH to use the shared shell scripts from delivery/env
if [ -d "$HOME/env/bin" ]; then
    PATH="$HOME/env/bin:$PATH"
fi

