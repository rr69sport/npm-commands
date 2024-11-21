#! /bin/bash

source ~/bash-sources/npm-commands/utils/colors.sh
source ~/bash-sources/npm-commands/services/package_managers.sh

select_package_manager() {
  while true; do

    read -p "¿Con qué gestor de paquetes desea iniciar el proyecto? (${package_managers[*]}): " choice
    choice=$(echo "$choice" | tr '[:upper:]' '[:lower:]')

    for option in "${package_managers[@]}"; do
      if [[ "$choice" == "$option" ]]; then
        export SELECTED_PACKAGE_MANAGER="$choice"  # Exportar la variable
        return 0
      fi
    done

    echo -e "${textRed}Opción no válida. Por favor, introduzca: ${textYellow}${package_managers[*]}${endColor}"
  done
}
