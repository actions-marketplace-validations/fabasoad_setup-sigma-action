#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  input_force="${1}"

  python_installed="false"
  if command -v python >/dev/null 2>&1; then
    python_version=$(python --version | cut -d ' ' -f 2)
    minor_version=$(echo "${python_version}" | cut -d '.' -f 2)
    # sigma >=2.0.0 requires python >=3.10
    if [ "${minor_version}" -ge 10 ]; then
      python_installed="true"
    fi
  fi
  echo "python-installed=${python_installed}" >> "$GITHUB_OUTPUT"

  bin_installed="false"
  if command -v sigma >/dev/null 2>&1; then
    if [ "${input_force}" = "false" ]; then
      msg="Installation skipped."
      bin_installed="true"
    else
      msg="Executing forced installation."
    fi
    log_info "sigma is found at $(which sigma). ${msg}"
  else
    log_info "sigma is not found. Executing installation."
  fi
  echo "bin-installed=${bin_installed}" >> "$GITHUB_OUTPUT"
}

main "$@"
