: '
Script to update the wordcloud image.
Requires the wordcloud_cli python tool:
    pip install wordcloud
    https://github.com/amueller/word_cloud

Generates intermediate .temp files in data/ which can be inspected
to see what is filtered out from the source files.

The blacklist (words to exclude) is in data/wordcloud_omit.txt.
Additional words can be added to the top of the file.
'

echo "    updating data/ALL.tex.temp"
cat src/*.tex > data/ALL.tex.temp

echo "    updating data/ALL.txt.temp"
cat data/ALL.tex.temp \
    | sed -E 's/^%.*//' \
    | sed -E 's/\\label{.*}/ /g' \
    | sed -E 's/\\Cref{.*}/ /g' \
    | sed -E 's/\\ref{.*}/ /g' \
    | sed -E 's/\\eqref{.*}/ /g' \
    | sed -E 's/\\cite(Main)?{.*}/ /g' \
    | sed -E 's/\\begin{.*}/ /g' \
    | sed -E 's/\\end{.*}/ /g' \
    | sed -E 's/\\[a-zA-Z]*//g' \
    | sed -E 's/_/ /g' \
    | sed -E 's/'\''/ /g' \
    > data/ALL.txt.temp

echo "    updating data/BIB.txt.temp"
cat src/*.bib \
    | grep -o -E '(\btitle|\bauthor).*=.*' \
    | sed -E 's/.*=//' \
    > data/BIB.txt.temp

echo "    updating data/wordcloud.png"
wordcloud_cli --text data/ALL.txt.temp \
    --width 2000 --height 1000 \
    --imagefile data/wordcloud.png \
    --random_state 1 \
    --stopwords data/wordcloud_omit.txt \
    --min_word_length 2

echo "    updating data/wordcloud_refs.png"
wordcloud_cli --text data/BIB.txt.temp \
    --width 2000 --height 1000 \
    --imagefile data/wordcloud_refs.png \
    --random_state 1 \
    --stopwords data/wordcloud_omit.txt \
    --min_word_length 2
