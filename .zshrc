# Source .zshenv in case /etc/profile or zprofile overide identities.
source $HOME/.zshenv

# ZPlug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug 'zplug/zplug', hook-build:'zplug --self-manage'

zplug "mafredri/zsh-async", from:github
zplug romkatv/powerlevel10k, as:theme, depth:1

zplug "psprint/zsh-navigation-tools", from:github
zplug "caarlos0-graveyard/zsh-pg", from:github
zplug "zuxfoucault/colored-man-pages_mod", from:github
zplug "changyuheng/zsh-interactive-cd", from:github

zplug "changyuheng/fz", defer:1
zplug "rupa/z", use:z.sh

zplug "zsh-users/zsh-completions", from:github
zplug "zsh-users/zsh-autosuggestions", from:github, defer:1

zplug "zdharma/fast-syntax-highlighting", from:github, defer:2
zplug "zsh-users/zsh-history-substring-search", from:github, defer:2
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down

# zplug "$HOME/.jp_zsh_theme", from:local, as:theme

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

zplug load

# FZF color scheme
_gen_fzf_default_opts() {

local color00='#1d1f21'
local color01='#282a2e'
local color02='#373b41'
local color03='#969896'
local color04='#b4b7b4'
local color05='#c5c8c6'
local color06='#e0e0e0'
local color07='#ffffff'
local color08='#cc6666'
local color09='#de935f'
local color0A='#f0c674'
local color0B='#b5bd68'
local color0C='#8abeb7'
local color0D='#81a2be'
local color0E='#b294bb'
local color0F='#a3685a'

export FZF_DEFAULT_OPTS="
  --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D
  --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C
  --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D
"

}

_gen_fzf_default_opts

# fzf opts
export FZF_COMPLETION_TRIGGER='§§'
export FZF_DEFAULT_OPTS="--height 40% --layout=reverse --border --inline-info"
export FZF_DEFAULT_COMMAND='fd --type f --color=always --hidden --follow --exclude .git'
export FZF_ALT_C_COMMAND='fd --type d --hidden --follow --exclude .git'
export FZF_CTRL_T_COMMAND='fd --type f --type d --color=always --hidden --follow --exclude .git'
export FZF_CTRL_R_OPTS="--preview 'echo {}' --preview-window down:3:hidden:wrap --bind '?:toggle-preview' --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort' --header 'Press CTRL-Y to copy command into clipboard' --border"

# autojump
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

unalias run-help
autoload run-help
export HELPDIR=/usr/local/share/zsh/help

fpath=(/usr/local/share/zsh/site-functions $fpath)

autoload -Uz promptinit

# extra bash completions
autoload -U +X compinit && compinit
autoload -U +X bashcompinit && bashcompinit
source $HOME/.gita-completion.bash

# Pyenv + nodenv
if which pyenv > /dev/null; then
    eval "$(pyenv init - zsh)"
    eval "$(pyenv virtualenv-init - zsh)"
    function pyenv_prompt_info() {
        echo "$(pyenv version-name)"
    }
    function conda_block() {
        echo "${CONDA_DEFAULT_ENV}"
    }
else
    # fallback to system python
    function pyenv_prompt_info() {
        echo "system: $(python -V 2>&1 | cut -f 2 -d ' ')"
    }
fi
if which nodenv > /dev/null; then
    eval "$(nodenv init -)";
fi
export VIRTUAL_ENV_DISABLE_PROMPT=1

if which rbenv > /dev/null; then
    eval "$(rbenv init -)";
fi

# Initial configs
typeset -gU cdpath fpath manpath path

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=10000
export SAVEHIST=10000
export HIST_STAMPS="dd.mm.yyyy"
export HISTCONTROL=ignoreboth
export ZSH_AUTOSUGGEST_USE_ASYNC=y
export DISABLE_UNTRACKED_FILES=true
export DISABLE_UPDATE_PROMPT=true

export MANPAGER='less -X'

autoload colors && colors
setopt correct

export LSCOLORS="exfxcxdxbxGxDxabagacad"
export LS_COLORS="di=34:ln=35:so=32:pi=33:ex=31:bd=36;01:cd=33;01:su=31;40;07:sg=36;40;07:tw=32;40;07:ow=33;40;07:"

bindkey -v

GPG_TTY=$(tty)
export GPG_TTY

# ZSH Configuration
unsetopt flow_control case_glob
setopt AUTO_NAME_DIRS CDABLE_VARS
setopt complete_in_word always_to_end glob_complete
setopt path_dirs auto_menu auto_list auto_param_slash
setopt noflowcontrol no_flow_control
setopt prompt_subst nonomatch notify interactivecomments
setopt hist_fcntl_lock autocd
setopt autopushd pushdignoredups pushd_silent pushd_to_home
setopt nolistbeep nobeep list_packed
setopt bang_hist extended_history inc_append_history share_history
setopt hist_expand hist_expire_dups_first hist_ignore_dups hist_ignore_all_dups
setopt hist_find_no_dups hist_ignore_space hist_save_no_dups hist_verify

# Group matches and describe.
zstyle ":completion:*" use-cache on
zstyle ":completion:*" cache-path ~/.zsh/cache
zstyle ":completion:*" matcher-list "m:{a-zA-Z}={A-Za-z}" "r:|[._-]=* r:|=*" "l:|=* r:|=*"
zstyle ":completion:*:*:*:*:*" menu select
zstyle ":completion:*:matches" group "yes"
zstyle ":completion:*:options" description "yes"
zstyle ":completion:*:options" auto-description "%d"
zstyle ":completion:*:corrections" format " %F{green}-- %d (errors: %e) --%f"
zstyle ":completion:*:descriptions" format " %F{yellow}-- %d --%f"
zstyle ":completion:*:messages" format " %F{purple} -- %d --%f"
zstyle ":completion:*:warnings" format " %F{red}-- no matches found --%f"
zstyle ":completion:*:default" list-prompt "%S%M matches%s"
zstyle ":completion:*" format " %F{yellow}-- %d --%f"
zstyle ":completion:*" group-name ""
zstyle ":completion:*" verbose yes

# Fuzzy match mistyped completions.
zstyle ":completion:*::::" completer _expand _complete _match _ignored _approximate
zstyle ":completion:*" menu select=1 _complete _ignored _approximate
zstyle ":completion:*:match:*" original only
zstyle ":completion:*:approximate:*" max-errors 1 numeric

# Increase the number of errors based on the length of the typed word.
zstyle -e ":completion:*:approximate:*" max-errors "reply=($((($#PREFIX+$#SUFFIX)/3))numeric)"

# Array completion element sorting.
zstyle ":completion:*:*:-subscript-:*" tag-order indexes parameters

# Directories
zstyle ":completion:*:default" list-colors ${(s.:.)LS_COLORS}
zstyle ":completion:*:*:cd:*" tag-order local-directories directory-stack path-directories
zstyle ":completion:*:*:cd:*:directory-stack" menu yes select
zstyle ":completion:*:-tilde-:*" group-order "named-directories" "path-directories" "users" "expand"
zstyle ":completion:*" squeeze-slashes true

# History
zstyle ":completion:*:history-words" stop yes
zstyle ":completion:*:history-words" remove-all-dups yes
zstyle ":completion:*:history-words" list false
zstyle ":completion:*:history-words" menu yes

# Environmental Variables
zstyle ":completion::*:(-command-|export):*" fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Ignore multiple entries.
zstyle ":completion:*:(rm|kill|diff):*" ignore-line other
zstyle ":completion:*:rm:*" file-patterns "*:all-files"

# Kill
zstyle ":completion:*:*:*:*:processes" command "ps -u $LOGNAME -o pid,user,command -w"
zstyle ":completion:*:*:kill:*:processes" list-colors "=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01"
zstyle ":completion:*:*:kill:*" menu yes select
zstyle ":completion:*:*:kill:*" force-list always
zstyle ":completion:*:*:kill:*" insert-ids single

# Man
zstyle ":completion:*:manuals" separate-sections true
zstyle ":completion:*:manuals.(^1*)" insert-sections true

# SSH/SCP/RSYNC
zstyle ":completion:*:(scp|rsync):*" tag-order "hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *"
zstyle ":completion:*:(scp|rsync):*" group-order users files all-files hosts-domain hosts-host hosts-ipaddr
zstyle ":completion:*:ssh:*" tag-order "hosts:-host:host hosts:-domain:domain hosts:-ipaddr:ip\ address *"
zstyle ":completion:*:ssh:*" group-order users hosts-domain hosts-host users hosts-ipaddr
zstyle ":completion:*:(ssh|scp|rsync):*:hosts-host" ignored-patterns "*(.|:)*" loopback ip6-loopback localhost ip6-localhost broadcasthost
zstyle ":completion:*:(ssh|scp|rsync):*:hosts-domain" ignored-patterns "<->.<->.<->.<->" "^[-[:alnum:]]##(.[-[:alnum:]]##)##" "*@*"
zstyle ":completion:*:(ssh|scp|rsync):*:hosts-ipaddr" ignored-patterns "^(<->.<->.<->.<->|(|::)([[:xdigit:].]##:(#c,2))##(|%*))" "127.0.0.<->" "255.255.255.255" "::1" "fe80::*"

# source fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# aliases
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias ......='cd ../../../../..'
alias cd.='cd ..'
alias cd..='cd ..'
alias l='ls -alF'
alias ll='ls -l'
alias vi='vim'
alias top='htop'
alias help='tldr'
alias ls='gls --color=tty'
alias gvim="vimr"
alias mux="tmuxinator"

# Personal aliases
alias x-start-pgsys="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias x-stop-pgsys="pg_ctl -D /usr/local/var/postgres stop -s -m fast"
alias x-print-tree="tree -al -I ".DS_Store' --filelimit 20'
alias x-cleanlogs="sudo rm -rf /private/var/log/asl/*.asl"
alias x-start-vm="VBoxManage startvm VM_GNA --type headless"
alias x-stop-vm="VBoxManage controlvm VM_GNA poweroff"
alias x-qgisBoundless="/Library/Boundless/Desktop/1.0/bin/qgis --configpath ~/.qgisBoundless"
alias dotdrop="$HOME/.dotfiles/dotdrop.sh --cfg=$HOME/.dotfile/cfg.yaml"
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; sudo rm -rfv ~/.Trash; sudo rm -rfv /private/var/log/asl/*.asl"

x-gna(){
    # pg_ctlcluster 9.6 main start;
    pyenv activate gna;
    cd ~/Dev/GNA/src/;
    echo $fg[red] "Settings module = $DJANGO_SETTINGS_MODULE";
}

x-gna-dev(){
    # pg_ctlcluster 9.6 main start;
    pyenv activate gna && export DJANGO_SETTINGS_MODULE=gna_project.settings.dev;
    cd ~/Dev/GNA/src/;
    echo $fg[green] "Dev Env. Settings module = $DJANGO_SETTINGS_MODULE";
}

x-gna-test(){
    # pg_ctlcluster 9.6 main start;
    pyenv activate gna && export DJANGO_SETTINGS_MODULE=gna_project.settings.test;
    cd ~/Dev/GNA/src/;
    echo $fg[yellow] "Test Env. Settings module = $DJANGO_SETTINGS_MODULE";
}

x-gna-supervisor(){
    pyenv activate gna;
    sudo supervisord -c $HOME/Dev/GNA/src/server/etc/supervisor/supervisor_dev.conf;
    sudo supervisorctl -c $HOME/Dev/GNA/src/server/etc/supervisor/supervisor_dev.conf;
}

x-gna-genschema(){
    stty echo; printf "Enter username for api: "; read USER;
    stty -echo; printf "Enter password for api: "; read PASS;
    stty echo; printf "\n";
    cd ~/Dev/GNA/src;
    coreapi credentials add gna.dev $USER:$PASS --auth basic;
    coreapi get http://gna.dev/api/v1/schema/;
    coreapi dump | jsonpp > schema.json;
    unset PASS; unset USER;
    echo "API schema file generated."
}

x-gna-CREATEDB(){
    createdb gna -O joao -E UTF-8 -l en_US.UTF-8 -D pg_default;
    echo "CREATE EXTENSION IF NOT EXISTS postgis SCHEMA public;\
        CREATE EXTENSION IF NOT EXISTS hstore;\
        CREATE SCHEMA topology AUTHORIZATION joao;\
        CREATE EXTENSION IF NOT EXISTS postgis_topology SCHEMA topology;\
        GRANT ALL PRIVILEGES ON DATABASE gna TO joao;\
        \q" | psql -e -d gna -U joao
}

x-gna-DROPDB(){
    cd ~/Dev/GNA/src/gna_project;
    dropdb gna -e -U joao;
    find . -type f -name "*.py[co]" -print -delete;
    find . -type d -name "__pycache__" -print -delete;
    find . -path "*/migrations/*.py" -not -name "__init__.py" -not -name "*data.py" -not -name "*initial.py" -print -delete;
}

x-gna-RECREATEDB(){
    cd ~/Dev/GNA/src/gna_project;
    dropdb gna -e -U joao;
    find . -type f -name "*.py[co]" -print -delete;
    find . -type d -name "__pycache__" -print -delete;
    find . -path "*/migrations/*.py" -not -name "__init__.py" -not -name "*data.py" -not -name "*initial.py" -print -delete;
    createdb gna -O joao -E UTF-8 -l en_US.UTF-8 -D pg_default;
    echo "CREATE EXTENSION IF NOT EXISTS postgis SCHEMA public;\
        CREATE EXTENSION IF NOT EXISTS hstore;\
        CREATE SCHEMA topology AUTHORIZATION joao;\
        CREATE EXTENSION IF NOT EXISTS postgis_topology SCHEMA topology;\
        GRANT ALL PRIVILEGES ON DATABASE gna TO joao;\
        \q" | psql -e -d gna -U joao;
    python manage.py makemigrations accounts;
    python manage.py makemigrations;
    python manage.py migrate;
    python manage.py loaddata initial_data -i
    python manage.py post_loaddata;
    python manage.py createsuperuser;
    python manage.py createinitialrevisions;
}

x-link-opensl(){
    export PATH="`brew --prefix openssl`/bin:`brew --prefix`/etc/openssl/misc:$PATH";
    openssl version;
}

x-thesis-make-pdf(){
    cd ~/Documents/PHD/Thesis;
    make pdf;
}

x-thesis-make-tex(){
    cd ~/Documents/PHD/Thesis;
    make tex;
}

x-thesis-make-doc(){
    cd ~/Documents/PHD/Thesis;
    make docx;
}

x-resize-images-in-folder(){
    sh ~/.scripts/resize_imgs.sh;
}

x-aws-comdata-start-pgtunel(){
    ssh -i /Users/joao/.ssh/joao-comdata-aws-ireland.pem -fN -L 5433:localhost:5432 comdata@ec2-52-18-109-175.eu-west-1.compute.amazonaws.com;
}
x-aws-comdata-check-pgtunel(){
    ps aux | grep 5433;
}
x-aws-comdata-login_as_comdata(){
    mosh --ssh "ssh -i /Users/joao/.ssh/joao-comdata-aws-ireland.pem" comdata@ec2-52-18-109-175.eu-west-1.compute.amazonaws.com;
}
x-update-pandocomatic(){
    sudo gem update paru pandocomatic -n /usr/local/bin
}
x-timemachine-purge(){
    tmutil  listlocalsnapshotdates / |grep 20|while read f; do tmutil deletelocalsnapshots $f; done
}
x-timemachine-thin(){
    tmutil thinlocalsnapshots / 10000000000 1
}
x-pg_backup(){
    sh /Users/joao/Dev/Tools/pg_back/pg_back -c "~/.pg_back.conf" -U joao;
}
x-python-org(){
    export PATH="/Library/Frameworks/Python.framework/Versions/3.6/bin:$PATH";
}
x-python-apple(){
    export PATH="/System/Library/Frameworks/Python.framework/Versions/2.7/bin:$PATH"
}
x-cleanbrew(){
    rm -rf $(brew --cache)
}

# fzf aliases

# vf - fuzzy open with vim from anywhere
# ex: vf word1 word2 ... (even part of a file name)
vf() {
  local files

  files=(${(f)"$(locate -Ai -0 $@ | grep -z -vE '~$' | fzf --read0 -0 -1 -m)"})

  if [[ -n $files ]]
  then
     vim -- $files
     print -l $files[1]
  fi
}

# fd - cd to selected directory
fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

# interactive cd
function cd() {
    if [[ "$#" != 0 ]]; then
        builtin cd "$@";
        return
    fi
    while true; do
        local lsd=$(echo ".." && ls -p | grep '/$' | sed 's;/$;;')
        local dir="$(printf '%s\n' "${lsd[@]}" |
            fzf --reverse --preview '
                __cd_nxt="$(echo {})";
                __cd_path="$(echo $(pwd)/${__cd_nxt} | sed "s;//;/;")";
                echo $__cd_path;
                echo;
                ls -p -FG "${__cd_path}";
        ')"
        [[ ${#dir} != 0 ]] || return 0
        builtin cd "$dir" &> /dev/null
    done
}

# fh - repeat history
fh() {
  print -z $( ([ -n "$ZSH_NAME" ] && fc -l 1 || history) | fzf +s --tac | sed 's/ *[0-9]* *//')
}

# tree
command -v tree > /dev/null && export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

# iTerm integration
source "${HOME}/.iterm2_shell_integration.zsh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/joao/.conda/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/joao/.conda/etc/profile.d/conda.sh" ]; then
        . "/Users/joao/.conda/etc/profile.d/conda.sh"
    else
        export PATH="/Users/joao/.conda/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
