: '
Script to update data/totals.txt with total size of all input files
'

echo "    updating data/totals.txt"
echo "===== Totals =====" > data/totals.txt
echo "   words   chars file" >> data/totals.txt
find -E src -regex ".*\.tex|.*\.bib" \
    | xargs wc -w -c \
    | sort \
    >> data/totals.txt
