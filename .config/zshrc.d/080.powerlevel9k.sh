POWERLEVEL9K_TIME_BACKGROUND='009'
POWERLEVEL9K_TIME_FOREGROUND='black'

POWERLEVEL9K_STATUS_CROSS=true

zsh_snakey_pyenv() {
    if [[ $(pyenv version-name) != "system" ]]; then
        if [[ $(pyenv version-name) != $(pyenv global) ]]; then
            echo "🐍"
        fi
    fi
}
POWERLEVEL9K_CUSTOM_SNAKEY_PYENV='zsh_snakey_pyenv'
POWERLEVEL9K_CUSTOM_SNAKEY_PYENV_BACKGROUND='grey'

zsh_snakey_virtualenv() {
    if [[ $(pyenv version-name) == "system" ]]; then
        if [[ -n "${VIRTUAL_ENV}" ]]; then
            echo "🐍"
        fi
    fi
}
POWERLEVEL9K_CUSTOM_SNAKEY_VIRTUALENV='zsh_snakey_virtualenv'
POWERLEVEL9K_CUSTOM_SNAKEY_VIRTUALENV_BACKGROUND='black'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context custom_snakey_virtualenv custom_snakey_pyenv dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs vcs time)

