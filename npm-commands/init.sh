#! /bin/bash

source ~/bash-sources/helpers/colors.sh

source ~/bash-sources/npm-commands/utils/confirm_new_project.sh
source ~/bash-sources/npm-commands/utils/select_package_manager.sh
source ~/bash-sources/npm-commands/utils/with_flag_y.sh

init() {
  if confirm_new_project; then
    select_package_manager
  fi

  # Preguntar si desea usar el flag -y (solo para npm y yarn)
  if [[ "$SELECTED_PACKAGE_MANAGER" == "npm" || "$SELECTED_PACKAGE_MANAGER" == "yarn" ]]; then
    if with_flag_y; then
      flag_y="-y"
    else
      flag_y=""
    fi
  fi

  # Ejecutar el comando correspondiente
  case $SELECTED_PACKAGE_MANAGER in
    npm|yarn) echo -e "Ejecutando ${textGreen}$SELECTED_PACKAGE_MANAGER init $flag_y...${endColor}"; "$SELECTED_PACKAGE_MANAGER" init $flag_y ;;
    pnpm|bun) echo -e "Ejecutando ${textGreen}$SELECTED_PACKAGE_MANAGER init...${endColor}"; "$SELECTED_PACKAGE_MANAGER" init ;;
  esac
}
