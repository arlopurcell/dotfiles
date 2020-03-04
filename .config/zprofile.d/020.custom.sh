export PATH="$HOME/.cargo/bin:$PATH"

# Expand $PATH to include ~/.local/bin
local_bin_path="${HOME}/.local/bin"
if [ -n "${PATH##*${local_bin_path}}" -a -n "${PATH##*${local_bin_path}:*}" ]; then
    export PATH=$PATH:${local_bin_path}
fi

# Expand $PATH to include ~/bin
user_bin_path="${HOME}/bin"
if [ -n "${PATH##*${user_bin_path}}" -a -n "${PATH##*${user_bin_path}:*}" ]; then
    export PATH=$PATH:${user_bin_path}
fi
