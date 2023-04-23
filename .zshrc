
# Path to your oh-my-zsh installation.
export EDITOR="nvim"
export STARSHIP_CONFIG="/home/plof/.starship.toml"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
autoload -U colors && colors
alias ls="ls --color=auto" 
alias diff='diff --color'
alias tareas='glow /home/plof/Documents/2do-semestre-Fes/2doSemestre/Tareas.md'
alias inicio='setsid blueman-applet && setsid dwmblocks && xrandr --output eDP1 --brightness 0.7 && xrandr --output VGA1 --brightness 0.5 && setMON && feh --bg-scale ~/Pictures/wallPaper'
alias eclipse="GTK_THEME=Adwaita eclipse"
export JAVA_HOME=/usr/lib/jvm/java-19-openjdk

export PS1="$(pwd)$ "

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
COMPLETION_WAITING_DOTS="%F{yellow}...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

#eval "$(dircolors)"
export LS_COLORS='*.go=01;44:*.rs=01;43'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}


#&&&&&&&&&&&&&&&&& VI-MODE &&&&&&&&&&&&&&&&&&&&&&&&&&
#plugins=(vi-mode)
#bindkey -v
#export KEYTIMEOUT=1
#
#function zle-keymap-select {
#  if [[ ${KEYMAP} == vicmd ]] ||
#     [[ $1 = 'block' ]]; then
#    echo -ne '\e[1 q'
#  elif [[ ${KEYMAP} == main ]] ||
#       [[ ${KEYMAP} == viins ]] ||
#       [[ ${KEYMAP} = '' ]] ||
#       [[ $1 = 'beam' ]]; then
#    echo -ne '\e[5 q'
#  fi
#}
#zle -N zle-keymap-select
#zle-line-init() {
#    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
#    echo -ne "\e[5 q"
#}
#zle -N zle-line-init
#echo -ne '\e[5 q' # Use beam shape cursor on startup.
#preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

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
bindkey  '^e' edit-command-line

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
alias ytdl="youtube-dl"
alias ytdl-m="youtube-dl -x --audio-format mp3 "

alias push="git push -u origin main"
#
alias tk="xclip -sel clip githubTokem && echo Copiado!"

alias push="tk && git push"

alias v="nvim"

alias gca='git add -A; git commit -m'

#alias ls='ls -a'

alias gc='git commit -m'

alias ga='git add'

alias gu='git add -u'

alias gs='git status'

alias gr='git restore'

alias gd='git diff'

alias pac='sudo pacman'

alias setMON='xrandr --output VGA1 --mode 1024x768 --right-of eDP1'

alias lf='lfrun'

alias grodoc='f(){ groff -ms "$1" -T pdf >> "$2"}'
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

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

eval "$(starship init zsh)"
