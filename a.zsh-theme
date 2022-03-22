username() {
    echo "%B%n%b% "
}

directory() {
    echo "%~"
}

status_symbol() {
    echo $'\u25cf'
}

status_ok() {
    echo "%F{green}$(status_symbol)%f"
}

status_err() {
    echo "%F{red}$(status_symbol)%f"
}

return_status() {
    echo "%(?:$(status_ok):$(status_err))"
}

prompt_indicator() {
    indicator="$"
    [[ $UID -eq 0 ]] && indicator="#"
    echo "%B$indicator%b"
}

ZSH_THEME_GIT_PROMPT_PREFIX=" %B%F{blue}("
ZSH_THEME_GIT_PROMPT_SUFFIX="%F{blue})%f%b"
ZSH_THEME_GIT_PROMPT_DIRTY="%F{yellow}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

PROMPT='$(return_status) $(username) $(directory)$(git_prompt_info) $(prompt_indicator) '
RPROMPT=''
