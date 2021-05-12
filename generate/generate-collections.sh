#!/bin/sh

BIBLE_CHAPTERS=$( curl -sL https://leojonathanoh.github.io/bible_databases/links/links-chapters.txt )
for i in ASV BBE KJV WEB YLT; do
    echo "Creating collections/bible-$i.txt"
    echo "$BIBLE_CHAPTERS" | grep "$i" > "collections/bible-$i.txt";
done
