# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

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
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
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
plugins=(
    # aws
    # bat  # cat replacement
    # command-not-found  # suggest package to install
    # diff-so-fancy  # git diff replacement
    # exa  # ls replacement
    # fasd
    fd  # find replacement
    fzf  # fuzzy finder
    fzf-tab
    git  # git aliases
    # golang  # golang
    # navi  # cheatsheet
    # npm  # npm
    # nvm  # node version manager
    # poetry  # python package manager
    pyenv
    # react-native  # react-native
    # rust
    shellfirm  # evaluate risk of shell commands
    # sudo  # sudo
    # systemd
    thefuck  # Correct previous console command
    # tmux
    # ubuntu
    # vscode
    # web-search
    # yarn
    zsh-autosuggestions
    zsh-completions
    fast-syntax-highlighting
    zsh-history-substring-search
)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# FUNCTIONS
# =========
function gcmojif {
	if [ -n $1 ]
	then
		gcmsg "$(gitmojify -m $1)"
	fi
}
_fzf_compgen_path() {
    fd --hidden --exclude .git . "$1"
}

_fzf_compgen_dir() {
    fd --type=d --hidden --exclude .git . "$1"
}

_fzf_comprun() {
   local command=$1
   shift

   case "$command" in
     cd) fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
     export|unset) fzf --preview "eval 'echo \$'{}" "$@" ;;
     ssh) fzf --preview 'dig {}' "$@" ;;
     cat|bat) fzf --preview 'bat -n --color=always {}' "$@" ;;
     *) fzf --preview '$HOME/.local/bin/fzf-preview.sh {}' "$@" ;;
   esac
 }

# ENV VARS
# ========

# PYENV
#------
export PYENV_ROOT="$HOME/.pyenv"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"

# DNGAUTOENV
# ----------
export AUTOENV_AVAILABLE_REPO_PATH=~/.config/dng/git_repos
export AUTOENV_OPT_FILES_DEFAULT=true
export AUTOENV_OPT_FILES='{"files": ["~/.config/dng/.env"], "dirs":["~/.config/dng/.vscode"]}'
export AUTOENV_PYTHON_VERSION_DEFAULT="3.11.8"
export AUTOENV_PRE_COMMIT_DEFAULT=true
export AUTOENV_POETRY_VERSION_DEFAULT="1.8.3"

# INSTANTCLIENT
#--------------
export LD_LIBRARY_PATH=/home/ubuntu/instantclient/instantclient_21_13

# ALIASES
# =======

# Global aliases
# --------------
alias cd="z"
alias ls="eza --icons=always --color=always --git"
alias czcmojif="cz --name cz_gitmoji commit"
alias cz-release="SKIP=markdownlint cz bump --check-consistency --changelog"
alias cz-release-dry="SKIP=markdownlint cz bump --check-consistency --changelog --dry-run" 
# Docker aliases
# --------------
alias dng-docker-build="docker build -f Dockerfile.autocontainer --build-arg POETRY_VERSION=\$POETRY_VERSION --build-arg PIP_REPO_LOGIN=\"\$(pass Work/pypi-azure-user)\" --build-arg PIP_REPO_PWD=\"\$(pass Work/pypi-azure-pwd)\" -t \"\$(basename \$PWD)\" ."
alias dng-docker-up="docker compose -f docker-compose.autocontainer.docker.yml build --build-arg POETRY_VERSION=\$POETRY_VERSION --build-arg PIP_REPO_LOGIN=\"\$(pass Work/pypi-azure-user)\" --build-arg PIP_REPO_PWD=\"\$(pass Work/pypi-azure-pwd)\" && docker compose -f docker-compose.autocontainer.docker.yml up"
alias dng-docker-down="docker compose -f docker-compose.autocontainer.docker.yml down"     
# Samba mounts
# ------------
# alias mnt-data2="sudo mount -t drvfs '\\\\vm3decdv02-private.discngine.com\\data2' /mnt/share/data2/publicdata"
alias mnt-data="sshfs opc@vm3decdv01.discngine.cloud:/data2 /mnt/share/data/ -o IdentityFile=/home/ubuntu/.ssh/vm3decdv01_ed25519,allow_other"
alias mnt-privatedata="sshfs opc@vm3decdv01.discngine.cloud:/data2/privatedata /mnt/share/data/privatedata -o IdentityFile=/home/ubuntu/.ssh/vm3decdv01_ed25519,allow_other"
alias mnt-publicdata="sshfs opc@vm3decdv01.discngine.cloud:/data2/publicdata /mnt/share/data/publicdata -o IdentityFile=/home/ubuntu/.ssh/vm3decdv01_ed25519,allow_other"
alias mnt-vm3decdv="mnt-data && mnt-privatedata && mnt-publicdata"
alias umnt-vm3decdv="sudo fusermmount -u /mnt/share/{data,privatedata,publicdata}"


# STARTUP COMMANDS
# ================
# /usr/bin/keychain -q --nogui $HOME/.ssh/github_ed25519
# source $HOME/.keychain/$HOST-sh
# LOAD PYENV
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# LOAD SMARTCD
[ -r "$HOME/.smartcd_config" ] && ( [ -n $BASH_VERSION ] || [ -n $ZSH_VERSION ] ) && source ~/.smartcd_config
# LOAD CUSTOM ENV VARS
#[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"
# LOAD NVM
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
eval "$(starship init zsh)"
eval "$(zoxide init zsh)"


# Enable using fzf preview with eza when using tab completion with `cd`
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:*' fzf-preview '$HOME/.local/bin/fzf-preview.sh $realpath'
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'eza --tree --color=always --icons=always --git $realpath | head -200'
zstyle ':fzf-tab:*' switch-group '<' '>'
