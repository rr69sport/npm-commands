#! /bin/bash

source ~/bash-sources/npm-commands/utils/colors.sh

with_flag_y() {
  while true; do

    read -r -p "¿Desea incluir el flag '-y' para inicializar con valores por defecto? (Y/N): " yn
    yn=$(echo "$yn" | tr '[:upper:]' '[:lower:]')  # Convertir a minúsculas

    case $yn in
      [yY])
        return 0
        ;;
      [nN])
        return 1
        ;;
      *)
        echo -e "${textRed}Opción no válida. Por favor, introduzca: ${textYellow}(Y/y) / (N/n)${endColor}."
        ;;
    esac
  done
}
