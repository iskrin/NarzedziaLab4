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

function createErrors() {
    script_name=$(basename "$0")
    num_files=$1
    mkdir error 
    cd error
    # Tworzenie plików logx.txt
    for ((i=1; i<=num_files; i++))
    do
    file_name="error${i}.txt"

    current_date=$(date +"%Y-%m-%d")
    echo "File name: $file_name" > "$file_name"
    echo "Script name: $script_name" >> "$file_name"
    echo "Date: $current_date" >> "$file_name"
    done
    cd ..
}
function showHelp() {
    echo
    echo '--log -l Stworzy 100 plików o nazwie log[nrpliku].txt zawierające nazwę skryptu nazwe pliku i date'
    echo
    echo '--log -l [n] Stworzy n plików o nazwie log[nrpliku].txt zawierające nazwę skryptu nazwe pliku i date'
    echo
    echo '--error -e Stworzy 100 plików o nazwie error[nrpliku].txt w katalogu error zawierające nazwę skryptu nazwe pliku i date'
    echo
    echo '--error -e [n] Stworzy n plików o nazwie error[nrpliku].txt w katalogu error zawierające nazwę skryptu nazwe pliku i date'
    echo
    echo '--date -d Wyświetli dzisiejszą date'
    echo
    echo '--innit -i klonuje repozytorium do katalogu oraz ustawia PATH'
    echo
    echo '--help -h Wyśiwetli to okno'
    echo
    echo 'Przy nie podaniu flagi wyswietli komunikad 'podaj flage''
}

function cloneRepo() {
    git clone https://github.com/iskrin/NarzedziaLab4.git
}

function setPath() {
    export PATH="$PATH:$(pwd)"
}

if [ "$1" == "--date" -o "$1" = "-d" ]; then
    echo "Dzisiejsza data to: $(date +"%Y-%m-%d")"
elif [ "$1" == "--logs" -o "$1" = "-l" ] && [ -z "$2" ]; then #default jeżeli nie został podany drugi parametr
    createFiles 100
elif [ "$1" = "--logs" -o "$1" = "-l" ] && [ -n "$2" ]; then #jeżeli został podany drugi parametr
    createFiles $2
elif [ "$1" = "--help" -o "$1" = "-h" ]; then #wyświetla help
    showHelp
elif [ "$1" = "--init" -o "$1" = "-i" ]; then #Klonuje całe repozytorium do katalogu w oraz ustawia PATH
    cloneRepo
    setPath
elif [ "$1" == "--error" -o "$1" = "-e" ] && [ -z "$2" ]; then #default jeżeli nie został podany drugi parametr
    createErrors 100
elif [ "$1" = "--error" -o "$1" = "-e" ] && [ -n "$2" ]; then #jeżeli został podany drugi parametr
    createErrors $2
else
  echo "podaj flage"
fi

