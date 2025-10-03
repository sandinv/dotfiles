[[ $- != *i* ]] && return

# Aliases
source ~/.aliases
source ~/.common_aliases

# General settings and init
export EDITOR=nvim
set -o vi
eval `ssh-agent`

# Functions
function reload() {
   source $HOME/.bashrc
}

function bashrc() {
   nvim $HOME/.bashrc
}

function load_envs() {
   while IFS='=' read -r key value
   do
      [[ -z "$key" || "$key" =~ ^# ]] && continue
      export "$key=$value"
   done <<< $(pass show environment)
}

function passc() {
   pass show --clip=1 $(ls ~/.password-store | sed 's/\.gpg//g'| fzf)
}

function pom_reset() {
   kill -USR1 $(cat ~/.cache/dwm_status.pid)
}

function pom_toggle() {
   kill -USR2 $(cat ~/.cache/dwm_status.pid)
}
   

