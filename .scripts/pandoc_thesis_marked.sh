#!/bin/bash

cat | pandoc \
    -s -S --normalize \
    --filter pandoc-crossref \
    --filter pandoc-citeproc \
    --latex-engine=xelatex \
    --template /Users/joao/Documents/PHD/Thesis/shared/template.html \
    --bibliography /Users/joao/Documents/PHD/Thesis/shared/references.bib \
    --csl /Users/joao/Documents/PHD/Thesis/shared/apajp.csl \
    -r markdown -w html \
