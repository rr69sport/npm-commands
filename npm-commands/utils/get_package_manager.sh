#! /bin/bash

source ~/bash-sources/npm-commands/services/package_managers.sh

get_package_manager() {
  local lock_file="$1"

  for i in "${!lock_files[@]}"; do
    if [[ "$lock_file" == "${lock_files[$i]}" ]]; then
      echo "${package_managers[$i]}"
      return 0
    fi
  done

  echo "null"
}
