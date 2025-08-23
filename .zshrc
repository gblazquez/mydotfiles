# Open tmux automatically (this is a custom code for powerlevel10k)
# NOTE: This should be put at the very begining
# Automatically start tmux if not already inside one
# if command -v tmux >/dev/null 2>&1; then
#     if [[ -z "$TMUX" ]] && [[ -n "$PS1" ]]; then
#         exec tmux
#     fi
# fi

# if command -v tmux &> /dev/null; then
#     [ -z "$TMUX" ] && exec tmux
# fi

case $- in *i*)
    [ -z "$TMUX" ] && exec tmux
esac

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
# zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Keybindings (-v means vi mode)
bindkey -v

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
# zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# In order to remove the ugly background color of some folders
LS_COLORS="$LS_COLORS:ow=1;34:tw=1;34:"
export LS_COLORS


#########
# Aliases
#########

# abbreviations
alias ls='ls --color'
alias nv='nvim'
alias c='clear'
alias q="exit"
# See function l at the end of this file
alias l='lt 1'
alias la='lta 1'
# find file and open
alias ff='open "$(fzf)"'
# find word
alias fw='rg "" | fzf'



# utils
# these are not working in zsh.
# alias openlast='open `ls -tr | tail -1`'
# alias cdlast='cd `ls -trd */ | tail -1`'
# alias vilast='vi `ls -tr */ | tail -1`'
# These work, but this is not bash but zsh language:
alias cdlast='cd *(/om[1])'
alias nvlast='nv *(.-om[1])'
alias openlast='open *(.-om[1])'
alias cleantex='rm -r *.toc *.aux *.log *.cp *.fn *.tp *.vr *.pg *.ky *.bbl *.fls *.fdb_latexmk *.blg *.gls *glg *ist *out *lot *lof *glo'

# Load alias specific to system
source "$HOME/.sysalias"

# Custom functions
function countdown {
seconds=$1; date1=$((`date +%s` + $seconds)); 
while [ "$date1" -ge `date +%s` ]; do 
    echo -ne "$(date -u --date @$(($date1 - `date +%s` )) +%H:%M:%S)\r"; 
done
}

function du_sort {
    local arg depth size
    while getopts 'd:s:' arg
    do
        case ${arg} in
	    d) depth=${OPTARG};;
	    s) size=${OPTARG};;
            *) return 1 # illegal option
        esac
    done
    du -h --max-depth=$depth | grep $size | sort -n -r
}

function log {
    log_path="$HOME/log_files"
    git -C $log_path pull
    log_folder="$1"	
    if [ ! -d "$log_path/$log_folder" ]; then
        # Control will enter here if $DIRECTORY does not exist.
        mkdir "$log_path/$log_folder"
    fi
    nv "$log_path/$log_folder/$(date -I).md"
    git -C $log_path add .
    git -C $log_path status
    git -C $log_path commit -m "$log_folder-$(date -I)"
    git -C $log_path status
    git -C $log_path push
}

function mdnote {
    log_path="$HOME/mdnotes"
    git -C $log_path pull
    log_folder="$1"	
    if [ ! -d "$log_path/$log_folder" ]; then
        # Control will enter here if $DIRECTORY does not exist.
        mkdir "$log_path/$log_folder"
    fi
    nv "$log_path/$log_folder/$log_folder.md"
    git -C $log_path add .
    git -C $log_path status
    git -C $log_path commit -m "$log_folder-$(date -I)"
    git -C $log_path status
    git -C $log_path push
}

function todo {
    todo_path="$HOME/todo"
    git -C $todo_path pull
    todo_folder="$1"
    if [ ! -d "$todo_path/$todo_folder" ]; then
        # Control will enter here if $DIRECTORY does not exist.
        mkdir "$todo_path/$todo_folder"
    fi
    nv "$todo_path/$todo_folder/$todo_folder.md"
    git -C $todo_path add .
    git -C $todo_path status
    git -C $todo_path commit -m "$todo_folder-$(date -I)"
    git -C $todo_path status
    git -C $todo_path push
}

function cplast {
    copy_path="$1"
    cp `ls -tr | tail -1` $copy_path
}

function lt {
    level="$1"
    eza -s=modified -l -T -L $level
}

function lta {
    level="$1"
    eza -s=modified -la -T -L $level
}
