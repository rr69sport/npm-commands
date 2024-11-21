#! /bin/bash

source ~/bash-sources/npm-commands/utils/colors.sh

confirm_new_project() {
  while true; do
    read -r -p "¿Quiere iniciar un proyecto nuevo? (Y/N): " option
    case $option in
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
