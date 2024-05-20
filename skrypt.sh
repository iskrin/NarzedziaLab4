if [ "$1" == "--date" ]; then
    echo "Dzisiejsza data to: $(date +"%Y-%m-%d")"
elif [ "$1" == "--logs" ]; then
    script_name=$(basename "$0")

# Tworzenie 100 plików logx.txt
for i in {1..100} 
do
    file_name="log${i}.txt"
    current_date=$(date +"%Y-%m-%d")

    echo "File name: $file_name" > "$file_name"
    echo "Script name: $script_name" >> "$file_name"
    echo "Date: $current_date" >> "$file_name"
done

else
  echo "podaj flage"
fi

