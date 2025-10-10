parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
    if [[ -n $branch ]]; then
        
        echo "$branch"
    else
        echo ""  # Return empty string if no branch
    fi
}
COLOR_DEF='%f'
COLOR_USR='%F{42}'
COLOR_DIR='%F{40}'
COLOR_GIT='%F{2}'
COLOR_CONDA='%F{45}'

NEWLINE=$'\n'
setopt PROMPT_SUBST
# Set the prompt to include the user, directory, and optionally the Git branch
export PROMPT='${COLOR_DIR}%2d$(parse_git_branch) ${COLOR_DEF}> '

# Add a space only if the branch is not empty
export PROMPT='${COLOR_DIR}%2d$(if [[ -n $(parse_git_branch) ]]; then echo " ${COLOR_GIT}$(parse_git_branch)"; fi) ${COLOR_DEF}> '

source $HOME/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /home/ziqiwang/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down


# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias ts='tmux-session'

HISTSIZE=500000
HISTFILESIZE=500000

if [ ! -z "$PS1" ]; then
    _tmuxrc="$HOME/.zshrc.tmux"
    if [ -e $_tmuxrc ]; then
        source $_tmuxrc
        _tmux-init-history
    fi
fi

export PATH=$PATH:~/.local/bin

APPDIR="/usr/local"

export PATH=$PATH:$APPDIR/nvim-macos-arm64/bin
