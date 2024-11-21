#! /bin/bash

detect_lock_file_type() {

  for lock_file in "${lock_files[@]}"; do
    [[ -f "$lock_file" ]] && { echo "$lock_file"; return 0; }
  done

  echo null
}
