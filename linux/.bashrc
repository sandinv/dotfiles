[[ $- != *i* ]] && return

# Aliases
source ~/.aliases
source ~/.common_aliases

# General settings and init
export EDITOR=nvim
set -o vi

# Start ssh-agent only if not already running
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    eval "$(ssh-agent -s)" > /dev/null
fi

# Export environment variables so new shells reuse the existing agent
export SSH_AGENT_PID=$(pgrep -u "$USER" ssh-agent | head -n1)
export SSH_AUTH_SOCK=$(find /tmp/ssh-* -user "$USER" -type s 2>/dev/null | head -n1)


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
   
function stream() {
    # Format of .music: <url> # Comment
    radio=$(cat ~/.music|sed '/^[[:space:]]*$/d'|fzf)
    # Get the URL
    url="${radio%%#*}"
    # Rename tmux window
    tmux rename-window "Radio"
    # Play it
    mpv --no-video --audio-display=no \
    --ytdl-format='bestaudio[ext=webm]/bestaudio/best' \
    --script-opts=ytdl_hook-ytdl_path=yt-dlp \
    $url

}

