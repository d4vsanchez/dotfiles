# Import Cargo
CARGO_HOME="${HOME}/.cargo"
if [ -d $CARGO_HOME ]; then
  export CARGO_HOME=$CARGO_HOME
  export PATH="${PATH}:${CARGO_HOME}/bin"
fi

# Import Poetry
POETRY_HOME="${HOME}/.poetry"
if [ -d $POETRY_HOME ]; then
  export POETRY_HOME=$POETRY_HOME
  export PATH="${PATH}:${POETRY_HOME}/bin"
fi

# Import Pyenv
PYENV_ROOT="${HOME}/.pyenv"
if [ -d $PYENV_ROOT ]; then
  export PYENV_ROOT=$PYENV_ROOT
  export PATH="${PATH}:${PYENV_ROOT}/bin"
fi

# Import Homebrew
if [ $(command -v brew) ]; then
  HOMEBREW_PATH=$(brew --prefix)
  export HOMEBREW_PATH=$HOMEBREW_PATH
  export PATH="${PATH}:${HOMEBREW_PATH}/bin"
  export PATH="${PATH}:${HOMEBREW_PATH}/sbin"
fi

# Import Volta
VOLTA_HOME="${HOME}/.volta"
if [ -d $VOLTA_HOME ]; then
  export VOLTA_HOME="${HOME}/.volta"
  export PATH="${PATH}:${VOLTA_HOME}/bin"
fi

# Import local
LOCAL_PATH="${HOME}/.local"
if [ -d $LOCAL_PATH ]; then
  export PATH="${PATH}:${LOCAL_PATH}/bin"
fi
