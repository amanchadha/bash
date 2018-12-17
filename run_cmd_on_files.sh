find . -type f -print0 | while IFS= read -r -d '' file; do
    echo $file
    #mv "$file" "${file// /_}"
done

clear

find . -type f | while IFS= read -r file; do
    echo $file
    #mv "$file" "${file// /_}"
done
