
CURRENT_WORKING_DIR=${PWD}

source "${CURRENT_WORKING_DIR}/logger.sh"

cmd_run() {
  local cmd_string=$1
  if ! is_dry_run; then
    eval "${cmd_string}"
  else
    echo "${cmd_string}"
  fi
}

file_exists() {
  [[ -f "$1" ]]
}
