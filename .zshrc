export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="ys"
plugins=(git zoxide)
source $ZSH/oh-my-zsh.sh

export PATH=/home/alex/.local/bin:$PATH

eval "$(zoxide init zsh)"

export FZF_DEFAULT_OPTS='--color=fg:#f8f8f2,bg:#282a36,hl:#bd93f9 --color=fg+:#f8f8f2,bg+:#44475a,hl+:#bd93f9 --color=info:#ffb86c,prompt:#50fa7b,pointer:#ff79c6 --color=marker:#ff79c6,spinner:#ffb86c,header:#6272a4'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
