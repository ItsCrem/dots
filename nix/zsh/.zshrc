# Set up the prompt

setopt histignorealldups sharehistory

export TERM=xterm
export EDITOR=vim
alias ls="lsd"
alias spython='sudo $(printenv VIRTUAL_ENV)/bin/python'
alias refresh='source /home/crem/.zshrc'
alias activate='source $(printenv PWD)/venv/bin/activate'
alias fd='fdfind'

#PATH DECLARTIONS
path+=('/home/crem/go/bin')
path+=('/usr/local/go/bin')

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=10000000000000
HISTFILE=~/.zsh_history

HISTFILE=~/.zsh_history
HISTSIZE=SAVEHIST=1000000000

bindkey -e

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND=none
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND=none

FZF_CTRL_T_COMMAND='fd --type f --hidden --exclude .git --exclude .cache'
FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[3~' delete-char

bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word

source ~/.zplug/init.zsh

# Use modern completion system
fpath=(~/.zsh/completion $fpath)
autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

source ~/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "lib/history", from:oh-my-zsh

zplug "junegunn/fzf", use:"shell/*.zsh"

zplug "zsh-users/zsh-completions"
#zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-history-substring-search", defer:2

zplug "woefe/git-prompt.zsh", use:"git-prompt.zsh"
# We must call this second so that git-prompt can have a chance to initalize

zplug load

eval "$(starship init zsh)"
eval "$(/home/crem/.local/bin/mise activate zsh)"
