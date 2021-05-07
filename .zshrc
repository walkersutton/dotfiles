ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

PATH="/usr/local/opt/openjdk@8/bin:$PATH"

# ALIASES
alias ls='ls -G'
alias l='ls -lh'
alias la='l -a'
alias sl=ls
alias ':q'='cd ..'

alias szrc='source ~/.zshrc && echo "sourced ~/.zshrc"'
alias vzrc='vim ~/.zshrc'
alias vvrc='vim ~/.vimrc'

alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

function chpwd() {
	la
}

# DOCKER
alias dra='docker rm $(docker ps -a -q)'

# PROMPT
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }
# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST
PROMPT='%F{green}%n@attis %1~ %F{yellow}${vcs_info_msg_0_} %F{green}%# %F{white}'



[ -f /Library/Developer/CommandLineTools/usr/share/git-core/git-completion.bash ]
