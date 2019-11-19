# Env vars from zsh
source $HOME/.zshenv

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export LS_COLORS="exfxcxdxbxegedabagacad"
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"


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

