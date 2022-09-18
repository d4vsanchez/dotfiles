LOGGER_DEBUG=""
LOGGER_SILENT=""
LOGGER_DRY_RUN=${LOGGER_DRY_RUN=""}

COLOR_GREEN='\033[0;32m'
COLOR_WHITE='\033[1;37m'
COLOR_YELLOW='\033[0;33m'

INFO_ICON="ℹ️"
SUCCESS_ICON="✅"
WARNING_ICON="⚠️"

is_silent() {
  [[ -n $LOGGER_SILENT ]]
}

is_dry_run() {
  [[ -n $LOGGER_DRY_RUN ]]
}

log() {
  local prefix=$1
  shift
  echo "${prefix}$*"
}

log_info() {
  local info_message="${INFO_ICON}  [INFO]"
  if ! is_silent; then
    log "${COLOR_WHITE}${info_message}: " "$@"
  fi
}

log_success() {
  local success_message="${SUCCESS_ICON} [SUCCESS]"
  if ! is_silent; then
    log "${COLOR_GREEN}${success_message}: " "$@"
  fi
}

log_warning() {
  local warning_message="${WARNING_ICON}  [WARNING]"
  if ! is_silent; then
    log "${COLOR_YELLOW}${warning_message}: " "$@"
  fi
}
