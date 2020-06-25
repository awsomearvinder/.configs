# Base16 Shell
if status --is-interactive
set BASE16_SHELL "$HOME/.config/base16-shell/"
source "$BASE16_SHELL/profile_helper.fish"
end



#Cargo bin
set -Ua fish_user_paths ~/.cargo/bin

#Zoxide
source ~/.config/fish/zoxide.fish

#Custom abbr's
if status --is-interactive
abbr -a ls "exa -a"
abbr -a lsl "exa -al"
end
