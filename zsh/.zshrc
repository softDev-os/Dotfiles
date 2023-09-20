# Carga los archivos de configuración y scripts necesarios
source ~/.local.zsh    # Tu configuración local personalizada
source ~/.aliases.zsh  # Tus alias personalizados
source ~/.plugins.zsh  # Scripts de plugins para Zsh

# Activa el prompt instantáneo de Powerlevel10k.
# Debería permanecer en la parte superior de ~/.zshrc.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" > /dev/null
fi

# Para personalizar el prompt, ejecuta `p10k configure` o edita ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

# Carga el script de FZF, si está presente
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Carga el tema de Powerlevel10k
source ~/.powerlevel10k/powerlevel10k.zsh-theme

# Posible línea que causa una advertencia en Zsh. Si no se necesita, puedes comentarla.
# typeset -g POWERLEVEL9K_INSTANT_PROMPT=quiet

# Finaliza la configuración del prompt instantáneo de Powerlevel10k.
# Debería permanecer en la parte inferior de ~/.zshrc.
(( ! ${+functions[p10k-instant-prompt-finalize]} )) || p10k-instant-prompt-finalize


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
