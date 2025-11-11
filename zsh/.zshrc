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

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/ziqiwang/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/ziqiwang/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/ziqiwang/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/ziqiwang/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

source /home/ziqiwang/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /home/ziqiwang/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

#bindkey "$terminfo[kcuu1]" history-substring-search-up
#bindkey "$terminfo[kcud1]" history-substring-search-down
export PROFILE=/usr/bin/zsh

export PROXY_URL='http://fihel1d-proxy.emea.nsn-net.net:8080'

export http_proxy=$PROXY_URL
export HTTP_PROXY=$PROXY_URL
export https_proxy=$PROXY_URL
export HTTPS_PROXY=$PROXY_URL
export ftp_proxy=$PROXY_URL
export FTP_PROXY=$PROXY_URL

export no_proxy="localhost,127.0.0.1,instance-data,169.254.169.254,10.135.73.50,.nokia.net,.nsn-net.net,.nsn-rdnet.net,.nokia.com,.nsn.com,.nokiasiemensnetworks.com,.alcatel-lucent.com,.internal,.testing,315829634537.dkr.ecr.eu-central-1.amazonaws.com,docker:2375,docker:2376"

export NODE_USE_ENV_PROXY=1

export PATH=$PATH:~/.local/bin

#export PATH=$PATH:~/.scripts/bin

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

export PATH=$PATH:/usr/local/go/bin

export PATH=$PATH:/usr/local/nvim-linux-x86_64/bin

### nvm installation result ###
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
### nvm installation result ###
