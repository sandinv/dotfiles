if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git fzf-zsh-plugin)

source $ZSH/oh-my-zsh.sh
source ~/.my_zshrc

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
