set -g fish_greeting
fzf --fish | source

if status is-interactive
    starship init fish | source
end

export LIBVA_DRIVER_NAME=nvidia
export VDPAU_DRIVER=nvidia
export EDITOR=nvim
export SUDO_EDITOR=nvim
export MANPAGER='nvim +Man!'
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
# List Directory

alias nvim='bash ~/.config/nvim/kitty.sh'
alias ls="lsd"
alias l="ls -l"
alias la="ls -a"
alias lla="ls -la"
alias lt="ls --tree"

# Handy change dir shortcuts
# abbr .. 'cd ..'
# abbr ... 'cd ../..'
# abbr .3 'cd ../../..'
# abbr .4 'cd ../../../..'
# abbr .5 'cd ../../../../..'
alias sptlrx= 'kitty -e -c /home/shin/.config/kitty/kitty-sptlrx.conf sptlrx'
alias c='clear' # clear terminal
# alias man='tldr' # clear terminal
alias l='eza -lh  --icons=auto --long --git --no-filesize --no-time --no-user' # long list
alias ls='eza -1   --icons=auto --long --git --no-filesize --no-time --no-user' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first --long --git --no-filesize --no-time --no-user' # long list all
alias ld='eza -lhD --icons=auto --long --git --no-filesize --no-time --no-user' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias un='$aurhelper -Rns' # uninstall package
alias up='$aurhelper -Syu' # update system/package/aur
alias pl='$aurhelper -Qs' # list installed package
alias pa='$aurhelper -Ss' # list availabe package
alias pc='$aurhelper -Sc' # remove unused cache
alias po='$aurhelper -Qtdq | $aurhelper -Rns -' # remove unused packages, also try > $aurhelper -Qqd | $aurhelper -Rsu --print -
alias vc='code' # gui code editor
alias grep='grep --color=auto'
alias cat='bat' # gui code editor
alias p='sudo pacman'
alias rm='trash -d'
alias cd='z'
alias cp='cp -r'
# Handy change dir shortcuts
alias ..='cd ..'
alias ...='cd ../..'
alias .2='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# yt-dlp

# Function to download with a specific quality
down() {
  local quality="$1"      # Get the first argument
  shift                   # Remove the first argument
  yt-dlp -S "res:${quality}" -- "$@"
}

# Function to download in mp4 format with specific name

mp4() {
  yt-dlp -f mp4 "$1" -o "$2.mp4"
}

# Aliases for specific resolutions
alias down360='down 360'
alias down480='down 480'
alias down720='down 720'
alias down1080='down 1080'
alias up="docker compose -f /media/greenbone-container/docker-compose.yml up -d"
# alias down="docker compose -f /media/greenbone-container/docker-compose.yml down"
alias bone="xdg-open "http://127.0.0.1:9392" 2>/dev/null >/dev/null &"

zoxide init fish | source
# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'
# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
abbr mkdir 'mkdir -p'

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# functions
function inbox
    set base_path /media/Docs/notes/FlyingNotes
    if test (count $argv) -eq 0
        set file_name ""
    else
        set file_name (string join " " $argv)
    end
    while test -z "$file_name"
        read -P "Enter the new note name: " file_name
        if test -z "$file_name"
            echo "Filename cannot be empty. please try again."
        end
    end
    if not string match -q "*.md" $file_name
        set file_name "$file_name.md"
    end
    set safe_file_name (string replace -a " " "-" $file_name)
    set full_path "$base_path/$safe_file_name"
    touch $full_path
    echo "New note created: $full_path"
    nvim $full_path
end

# pokemon-colorscripts --no-title -r 1,3,6
# uv
fish_add_path "/home/shin/.local/bin"
fish_add_path "/home/shin/.local/share/bin"
fish_add_path "/home/shin/.local/share/custom/bin"
fish_add_path "/home/shin/.cargo/bin"
