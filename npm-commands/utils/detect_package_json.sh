#! /bin/bash

detect_package_json() {
  if [[ -f package.json ]]; then echo "true"; else echo "false"; fi
}
