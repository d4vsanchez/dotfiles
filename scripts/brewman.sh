#!/bin/sh

# Title        brewman
# Author       David Sánchez
# Description  Manage Homebrew configuration from a single script

CURRENT_WORKING_DIR=${PWD}
CURRENT_WORKING_ROOT_DIR=$(dirname "${CURRENT_WORKING_DIR}")

source "${CURRENT_WORKING_DIR}/logger.sh"
source "${CURRENT_WORKING_DIR}/install.sh"
source "${CURRENT_WORKING_DIR}/string.sh"

CUSTOM_BREW_PACKAGES_PATH=${CUSTOM_BREW_PACKAGES_PATH="${CURRENT_WORKING_ROOT_DIR}/brew/packages.txt"}
CUSTOM_BREW_CASKS_PATH=${CUSTOM_BREW_CASKS_PATH="${CURRENT_WORKING_ROOT_DIR}/brew/casks.txt"}

dir_exists() {
  [[ -d "$1" ]]
}

brew_verify_install() {
  log_info "Checking if Homebrew is installed"
  if ! dir_exists "/usr/local/Homebrew"; then
    log_info "Homebrew is not installed, will install..."
    cmd_run '/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"'
  else
    log_success "Homebrew is already installed"
  fi
}

brew_install_taps() {
  log_info "Installing Homebrew taps..."
  cmd_run "brew tap homebrew/cask-fonts"
}

brew_cmd_run() {
  local command=$1
  local params=$2
  cmd_run "brew ${command} ${params}"
}

brew_install_casks() {
  if ! file_exists "${CUSTOM_BREW_CASKS_PATH}"; then
    log_warning "File containing custom Homebrew casks not found"
    return 1
  fi

  brew_casks=$(array_from_file "${CUSTOM_BREW_CASKS_PATH}")

  if is_empty_array $brew_casks; then
    log_info "No custom Homebrew casks found"
  else
    log_info "Installing/Updating Homebrew casks..."
    log_info "\tCasks: ${brew_casks[@]}"
    brew_cmd_run "install --cask" "${brew_casks}"
    log_success "Casks installed"
  fi
}

brew_install_packages() {
  if ! file_exists "${CUSTOM_BREW_PACKAGES_PATH}"; then
    log_warning "File containing custom Homebrew casks not found"
    return 1
  fi

  brew_packages=$(array_from_file "${CUSTOM_BREW_PACKAGES_PATH}")

  if is_empty_array $brew_packages; then
    log_info "No custom Homebrew packages found"
  else
    log_info "Installing/Updating Homebrew packages..."
    log_info "\tPackages: ${brew_packages[@]}"
    brew_cmd_run "install" "${brew_packages}"
    log_success "Packages installed"
  fi
}

run_brewman() {
  local option=$1

  brew_verify_install
  brew_install_taps

  if [[ "${option}" == "packages" || "${option}" == "all" ]]; then
    brew_install_packages
  fi

  if [[ "${option}" == "casks" || "${option}" == "all" ]]; then
    brew_install_casks
  fi

  log_info "Brewman completed successfully"
}

run_brewman "$@"
