export PATH="$HOME/.cargo/bin:$PATH"

# Expand $PATH to include ~/.local/bin
local_bin_path="${HOME}/.local/bin"
if [ -n "${PATH##*${local_bin_path}}" -a -n "${PATH##*${local_bin_path}:*}" ]; then
    export PATH=$PATH:${local_bin_path}
fi
