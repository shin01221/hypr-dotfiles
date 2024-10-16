set -g fish_greeting
fzf --fish | source

if status is-interactive
    starship init fish | source
end

export EDITOR=nvim
export CLASSPATH=/media/Learning/AI-JAD/jade/jade-core/jade/lib/jade.jar
export CC="clang"
export CFLAGS="-fsanitize=signed-integer-overflow -fsanitize=undefined -ggdb3 -O0 -std=c11 -Wall -Werror -Wextra -Wno-sign-compare -Wno-unused-parameter -Wno-unused-variable -Wshadow"
export LDLIBS="-lcrypt -lcs50 -lm"


# List Directory
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
alias man='tldr' # clear terminal
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
    set base_path /media/Docs/notes/inbox
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
