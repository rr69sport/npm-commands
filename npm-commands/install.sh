#! /bin/bash

source ~/bash-sources/npm-commands/utils/colors.sh

source ~/bash-sources/npm-commands/utils/detect_package_json.sh
source ~/bash-sources/npm-commands/utils/detect_lock_file.sh
source ~/bash-sources/npm-commands/utils/select_package_manager.sh
source ~/bash-sources/npm-commands/utils/get_package_manager.sh

install() {
  package_json=$(detect_package_json)
  lock_file_type=$(detect_lock_file_type)

  if [[ "$package_json" == "false" && "$lock_file_type" == "null" ]]; then
    echo -e "${textRed}No se detectó package.json ni ningún archivo de bloqueo.${endColor}"
    init
    return 0
  fi

  if [[ $package_json == "true" && $lock_file_type == "null" ]]; then
    echo -e "Detectado ${textYellow}package.json${endColor}, pero no se encontró ningún archivo de bloqueo."

    if [[ -z "$SELECTED_PACKAGE_MANAGER" ]]; then
      select_package_manager
    fi

    echo -e "Ejecutando ${textGreen}$SELECTED_PACKAGE_MANAGER install...${endColor}"
    $SELECTED_PACKAGE_MANAGER install
  fi

  if [[ "$package_json" == "true" && "$lock_file_type" != "null" ]]; then
    package_manager=$(get_package_manager "$lock_file_type")
    echo -e "Detectado ${textGreen}[package.json]${endColor} y ${textGreen}$lock_file_type${endColor}, ejecutando ${textGreen}$package_manager...${endColor}"
    return 0
  fi
}
