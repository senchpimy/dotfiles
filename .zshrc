
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
#
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history
_comp_options+=(globdots)
# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

#&&&&&&&&&&&&&&&&& VI-MODE &&&&&&&&&&&&&&&&&&&&&&&&&&
#plugins=(vi-mode)
bindkey -v
export KEYTIMEOUT=1

function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#&&&&&&&&&&&&&&&&& SWITCH DIRS &&&&&&&&&&&&&&&&&&&&&&&&&&
#ctr-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

#&&&&&&&&&&&&&&&&& Edit Line &&&&&&&&&&&&&&&&&&&&&&&&&&
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#&&&&&&&&&&&&&&&&& ALIAS &&&&&&&&&&&&&&&&&&&&&&&&&&
# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#
#
alias status="git status"

alias ytdl="youtube-dl"

alias push="git push -u origin main"
#
alias tk="xclip -sel clip githubTokem && echo Copiado!"

alias push="tk && git push"

alias v="nvim"

alias gca='git add -A; git commit -m'

#alias ls='ls -a'

alias gc='git commit -m'

alias ga='git add'

alias doc='f(){ pandoc "$1" \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -t ms \
    -o "$2"};f '

alias pac='sudo pacman'

alias lf='lfrun'

alias grodoc='f(){ groff -ms "$1" -T pdf >> "$2"}'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LF_ICONS="\
*.jpg=nigga
	"
##//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
#alias ide='tmux split-window -h -p 30 ; tmux split-window -v -p 75 ; tmux last-pane ; nvim'
#
#function killAllUnnameTmuxSession() {
#  echo "\n👉 kill all unname tmux session"
#  cd /tmp/
#  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
#  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
#  chmod +x killAllUnnameTmuxSessionOutput.sh
#  ./killAllUnnameTmuxSessionOutput.sh
#  cd -
#  tmux ls
#}
#
#function killAllUnnameTmuxSessionNoMessage() {
#  cd /tmp/
#  tmux ls | awk '{print $1}' | grep -o '[0-9]\+' >/tmp/killAllUnnameTmuxSessionOutput.sh
#  sed -i 's/^/tmux kill-session -t /' killAllUnnameTmuxSessionOutput.sh
#  chmod +x killAllUnnameTmuxSessionOutput.sh
#  ./killAllUnnameTmuxSessionOutput.sh
#  cd -
#}
#
#alias clear='killAllUnnameTmuxSessionNoMessage ; clear -x'
#alias cler='clear'
#alias clea='clear'
#alias cl='clear'
#
#function tmuxSessionSwitch() {
#  local session
#  session=$(tmux list-sessions -F "#{session_name}" | fzfDown)
#  tmux switch-client -t "$session"
#}
#alias af='tmuxSessionSwitch'
#source /usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh

