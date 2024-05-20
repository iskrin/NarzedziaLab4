function showHelp() {
    echo
    echo '--log Stworzy 100 plików o nazwie log[nrpliku].txt zawierające nazwę skryptu nazwe pliku i date'
    echo
    echo '--log [n] Stworzy n plików o nazwie log[nrpliku].txt zawierające nazwę skryptu nazwe pliku i date'
    echo
    echo '--date Wyświetli dzisiejszą date'
    echo
    echo '--help Wyśiwetli to okno'
    echo
    echo 'Przy nie podaniu flagi wyswietli komunikad 'podaj flage''
}

function createFiles() {
    script_name=$(basename "$0")
    num_files=$1

    # Tworzenie plików logx.txt
    for ((i=1; i<=num_files; i++))
    do
    file_name="log${i}.txt"

    current_date=$(date +"%Y-%m-%d")
    echo "File name: $file_name" > "$file_name"
    echo "Script name: $script_name" >> "$file_name"
    echo "Date: $current_date" >> "$file_name"
    done
}

if [ "$1" == "--date" -o "$1" = "-d" ]; then
    echo "Dzisiejsza data to: $(date +"%Y-%m-%d")"
elif [ "$1" == "--logs" -o "$1" = "-l" ] && [ -z "$2" ]; then #default jeżeli nie został podany drugi parametr
    createFiles 100
elif [ "$1" = "--logs" -o "$1" = "-l" ] && [ -n "$2" ]; then #jeżeli został podany drugi parametr
    createFiles $2
elif [ "$1" = "--help" -o "$1" = "-h" ]; then #wyświetla help
    showHelp
else
  echo "podaj flage"
fi

