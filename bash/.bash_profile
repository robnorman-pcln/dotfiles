#          ___
#       . ⚆ ⚆ `\
#     ~(:(::)~  )
#       |||      \
#       |||   @walrusk
#
# .bash_profile

## LOCAL
if [ -f ./.bash_profile.local ]; then
    source ./.bash_profile.local
fi

## PATH
export PATH="$PATH:/usr/local/sbin"
export PATH="$PATH:~/.dotfiles/bin"
export PATH="$PATH:~/.composer/vendor/bin"
export PATH="$PATH:~/.rbenv/shims"

## ENV
export EDITOR='vim'
export BASH_IT=~/.bash_it
export BASH_IT_THEME='minimal'

## ALIASES
alias d='docker $*'
alias d-c='docker-compose $*'
alias pubkey="more ~/.ssh/id_rsa.pub | pbcopy | echo '=> Public key copied to pasteboard.'"
alias ll='ls -l'
alias tmuxin='tmuxinator'
alias wsk='tmuxinator start walrusk'
alias ctags="`brew --prefix`/bin/ctags"

## GIT ALIASES / FUNCTIONS
alias g='git status'
alias gc='git commit'
alias gp='git pull'
alias gs='git status -sb' # upgrade your git if -sb breaks for you. it's fun.
alias gl="git log --graph --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias ge='git-edit-new'

## FUNCTIONS
function gco () { git checkout $(git branch | fzf-tmux -d 15 | sed 's/\*//g');  }
function gbd () { git branch -D $(git branch | fzf-tmux -d 15 | sed 's/\*//g'); }
function grb () { git checkout --track $(git branch -r | fzf-tmux -d 15 | sed 's/\*//g'); }
function fz () { vim $(fd --type f --hidden --follow --exclude .git | fzf-tmux -d 15 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'); }
function fd () { cd $(fd --type d --hidden --follow --exclude .git | fzf-tmux -d 15 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'); }
function fc () { $(fd --type f --hidden --follow --exclude .git | fzf-tmux -d 15 --preview '[[ $(file --mime {}) =~ binary ]] && echo {} is a binary file || (highlight -O ansi -l {} || cat {}) 2> /dev/null | head -500'); }
function mcd() { [[ "$1" ]] && mkdir -p "$1" && cd "$1"; }
function calc () { bc -l <<< "$@"; }

## PLUGIN HOOKS
eval "$(direnv hook bash)"
eval "$(rbenv init -)"
[ -f $(brew --prefix)/etc/profile.d/z.sh ] && source $(brew --prefix)/etc/profile.d/z.sh
[ -f $(brew --prefix)/etc/grc.bashrc ] && source `brew --prefix`/etc/grc.bashrc

if [ -f ~/.dotfiles/bin/git-completion ]; then
    . ~/.dotfiles/bin/git-completion
    __git_complete gc _git_checkout
    __git_complete gm __git_merge
    __git_complete gl _git_pull
    __git_complete gp _git_push
fi

bind '"\C-r": "\C-x1\e^\er"'
bind -x '"\C-x1": __fzf_history';

function __fzf_history () {
  __ehc $(history | fzf-tmux -d 25 --tac --tiebreak=index | perl -ne 'm/^\s*([0-9]+)/ and print "!$1"')
}

function __ehc () {
    if [[ -n $1 ]]; then
        bind '"\er": redraw-current-line'
        bind '"\e^": magic-space'
        READLINE_LINE=${READLINE_LINE:+${READLINE_LINE:0:READLINE_POINT}}${1}${READLINE_LINE:+${READLINE_LINE:READLINE_POINT}}
        READLINE_POINT=$(( READLINE_POINT + ${#1} ))
    else
        bind '"\er":'
        bind '"\e^":'
    fi
}

# Google Cloud / updates PATH for Google Cloud SDK / enables shell command completion
#source '~/exec -l /bin/bash/google-cloud-sdk/path.bash.inc'
#source '~/exec -l /bin/bash/google-cloud-sdk/completion.bash.inc'

source "$BASH_IT"/bash_it.sh
