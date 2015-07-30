EC() {
        echo -e '\e[1;33m'exit code: $?'\e[m\n'
}
trap EC ERR
