#!/bin/sh

set -eu

BIBLE_CHAPTERS=$( curl -sL https://leojonathanoh.github.io/bible_databases/links/links-chapters.txt )
for i in ASV BBE KJV WEB YLT; do
    echo "Creating collections/bible-$i.txt"
    echo "$BIBLE_CHAPTERS" | grep "$i" > "collections/bible-$i.txt";
done

BIBLE_BOOKS=$( cat - <<'EOF'
Genesis
Exodus
Leviticus
Numbers
Deuteronomy
Joshua
Judges
Ruth
1 Samuel
2 Samuel
1 Kings
2 Kings
1 Chronicles
2 Chronicles
Ezra
Nehemiah
Esther
Job
Psalms
Proverbs
Ecclesiastes
Song of Solomon
Isaiah
Jeremiah
Lamentations
Ezekiel
Daniel
Hosea
Joel
Amos
Obadiah
Jonah
Micah
Nahum
Habakkuk
Zephaniah
Haggai
Zechariah
Malachi
Matthew
Mark
Luke
John
Acts
Romans
1 Corinthians
2 Corinthians
Galatians
Ephesians
Philippians
Colossians
1 Thessalonians
2 Thessalonians
1 Timothy
2 Timothy
Titus
Philemon
Hebrews
James
1 Peter
2 Peter
1 John
2 John
3 John
Jude
Revelation
EOF
)

for i in ASV BBE KJV WEB YLT; do
    echo "$BIBLE_BOOKS" | while read -r b; do
        FILE="bible-$i-$( echo "$b" | sed 's/\s/-/g' | tr '[:upper:]' '[:lower:]' ).txt"
        echo "Creating collections/$FILE"
        echo "$BIBLE_CHAPTERS" | grep "$i" | grep "$( echo "$b" | sed 's/\s/%20/g' )" > "collections/$FILE";
    done
done
