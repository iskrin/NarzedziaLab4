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

if [ "$1" == "--date" ]; then
    echo "Dzisiejsza data to: $(date +"%Y-%m-%d")"
elif [ "$1" == "--logs" ] && [ -z "$2" ]; then #default jeżeli nie został podany drugi parametr
    createFiles 100
elif [ "$1" = "--logs" ] && [ -n "$2" ]; then #jeżeli został podany drugi parametr
    createFiles $2
else
  echo "podaj flage"
fi

