export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/go/bin:$PATH
export GOPATH=$HOME/.local/go
export PATH=$HOME/.config/nvim/utils/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$PATH:/usr/local/go/bin
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.pyenv/bin:$PATH

eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
