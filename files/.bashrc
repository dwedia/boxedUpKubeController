if [ -f /kubecontrol/configs/setenv.sh ]; then
    source /kubecontrol/configs/setenv.sh
fi

# Set up bash completion for kubectl
source <(kubectl completion bash)

# Aliases
alias grep='grep --color=auto'
alias l.='ls -d .* --color=auto'
alias ll='ls -l --color=auto'
alias ls='ls --color=auto'
alias path='echo -e ${PATH//:/\\n}'