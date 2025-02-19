# export LUA_PATH=/usr/bin/lua5.1
export PATH="${HOME}/.local/bin:${PATH}"
export SUDO_EDITOR=nvim
export MANPAGER='nvim +Man!'
export CLASSPATH=/media/Learning/AI-JAD/JADE-all-4.6.0/jade/lib/jade.jar
export EDITOR=nvim
export PATH=/home/shin/.tmux/plugins/tmuxifier/bin:$PATH
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"
source <(fzf --zsh)
# Path to your oh-my-zsh installation.
ZSH=/usr/share/oh-my-zsh/
eval "$(starship init zsh)"

# Path to powerlevel10k theme
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
# List of plugins used
plugins=( git sudo zsh-256color zsh-autosuggestions zsh-syntax-highlighting )
source $ZSH/oh-my-zsh.sh

# In case a command is not found, try to find the package that has it
function command_not_found_handler {
local purple='\e[1;35m' bright='\e[0;1m' green='\e[1;32m' reset='\e[0m'
printf 'zsh: command not found: %s\n' "$1"
local entries=( ${(f)"$(/usr/bin/pacman -F --machinereadable -- "/usr/bin/$1")"} )
if (( ${#entries[@]} )) ; then
  printf "${bright}$1${reset} may be found in the following packages:\n"
  local pkg
  for entry in "${entries[@]}" ; do
    local fields=( ${(0)entry} )
    if [[ "$pkg" != "${fields[2]}" ]] ; then
      printf "${purple}%s/${bright}%s ${green}%s${reset}\n" "${fields[1]}" "${fields[2]}" "${fields[3]}"
    fi
    printf '    /%s\n' "${fields[4]}"
    pkg="${fields[2]}"
  done
fi
return 126
}
  
# Detect the AUR wrapper
if pacman -Qi yay &>/dev/null ; then
  aurhelper="yay"
elif pacman -Qi paru &>/dev/null ; then
   aurhelper="paru"
fi

function in {
    local -a inPkg=("$@")
    local -a arch=()
    local -a aur=()

    for pkg in "${inPkg[@]}"; do
        if pacman -Si "${pkg}" &>/dev/null ; then
            arch+=("${pkg}")
        else 
            aur+=("${pkg}")
        fi
    done

    if [[ ${#arch[@]} -gt 0 ]]; then
        sudo pacman -S "${arch[@]}"
    fi

    if [[ ${#aur[@]} -gt 0 ]]; then
        ${aurhelper} -S "${aur[@]}"
    fi
}

# vi mode
bindkey -v
export KEYTIMEOUT=1
# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[1 q';;      # block
        viins|main) echo -ne '\e[5 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

bindkey -s '^o' '^ulfcd\n'

bindkey -s '^a' '^ubc -lq\n'

bindkey -s '^f' '^ucd "$(dirname "$(fzf)")"\n'

bindkey '^[[P' delete-char

# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line
bindkey -M vicmd '^[[P' vi-delete-char
bindkey -M vicmd '^e' edit-command-line
bindkey -M visual '^[[P' vi-delete

# yt-dlp

down() {
  local quality=$1
  shift
  yt-dlp -S res:"${quality}" "$@"
}

mp4() {
  yt-dlp -f mp4 "$1" -o "$2.mp4"
}

alias down360='down 480'
alias down480='down 480'
alias down720='down 720'
alias down1080='down 1080'

# Helpful aliases
alias nvim='~/.config/nvim/kitty.sh'
alias  sptlrx= 'kitty -e -c /home/shin/.config/kitty/kitty-sptlrx.conf sptlrx'
alias  c='clear' # clear terminal
alias  l='eza -lh  --icons=auto --long --git --no-filesize --no-time --no-user' # long list
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

# Always mkdir a path (this doesn't inhibit functionality to make a single dir)
alias mkdir='mkdir -p'
#the fuck
eval $(thefuck --alias)
eval $(thefuck --alias fk)
#zoxide
eval "$(zoxide init zsh)"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[[ -s "/etc/grc.zsh" ]] && source /etc/grc.zsh
#Display Pokemon
pokemon-colorscripts --no-title -r 1,3,6

[ -s ~/.luaver/luaver ] && . ~/.luaver/luaver

