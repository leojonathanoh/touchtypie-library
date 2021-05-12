#!/bin/sh

set -eu

rm index.md

MD_TABLE_TITLE='| Libraries | '
MD_TABLE_ALIGNER='|---|'
MD_TABLE_CONTENT=$(
    find libraries/ -type f | while read -r l; do
        link="https://leojonathanoh.github.io/typie-library/$l"
        echo "| [$link]($link) |";
    done
)

cat - >> index.md <<EOF
$MD_TABLE_TITLE
$MD_TABLE_ALIGNER
$MD_TABLE_CONTENT

EOF

MD_TABLE_TITLE='| Collections | '
MD_TABLE_ALIGNER='|---|'
MD_TABLE_CONTENT=$(
    find collections/ -type f | while read -r l; do
        link="https://leojonathanoh.github.io/typie-library/$l"
        echo "| [$link]($link) |";
    done
)

cat - >> index.md <<EOF
$MD_TABLE_TITLE
$MD_TABLE_ALIGNER
$MD_TABLE_CONTENT

EOF


MD_TABLE_TITLE='| Entities | '
MD_TABLE_ALIGNER='|---|'
MD_TABLE_CONTENT=$(
    find entities/ -type f | while read -r l; do
        link="https://leojonathanoh.github.io/typie-library/$l"
        echo "| [$link]($link) |";
    done
)

cat - >> index.md <<EOF
$MD_TABLE_TITLE
$MD_TABLE_ALIGNER
$MD_TABLE_CONTENT

EOF
