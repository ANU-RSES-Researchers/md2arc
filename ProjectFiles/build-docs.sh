#! /usr/bin/env bash

# MacOS
# brew install pandoc | conda install pandoc
# brew install pandoc-crossref | conda install pandoc-crossref
# npm install --global mermaid-filter  # 


## There is just the one template that applies to all the docs. It ONLY deals with formatting and not content. The RO template is the guide, but Pandoc needs to have the right styles defined to match its internal representation

TEMPLATE="../ARC-template.docx"
NOW=`date  "+%d%b%y-%H.%M.%S"`
OUTDIR="GeneratedFiles-$NOW"

mkdir -p $OUTDIR


## Project Description

MDFILE="DP-ProjectDescription.md"
WDFILE="$OUTDIR/DP-ProjectDescription.docx"
BIBLIOFILE="Bibliography/MyBibliography.bib"
BIBSTYLE="Bibliography/geophysics.csl"
FILTERS="-F pandoc-crossref -F mermaid-filter"  # only if you have mermaid installed !

pandoc $MDFILE -o $WDFILE  --bibliography $BIBLIOFILE $FILTERS --citeproc --csl $BIBSTYLE --reference-doc=$TEMPLATE && echo "Generated $WDFILE"

## Build the budget documents (less complicated / no bibliography / no citations)

MDFILE="BudgetJustification_ARC.md"
WDFILE="$OUTDIR/BudgetJustification_ARC.docx"
pandoc $MDFILE -o $WDFILE --reference-doc=$TEMPLATE && echo "Generated $WDFILE"

MDFILE="BudgetJustification_NonARC.md"
WDFILE="$OUTDIR/BudgetJustification_NonARC.docx"
pandoc $MDFILE -o $WDFILE --reference-doc=$TEMPLATE && echo "Generated $WDFILE"

## ROPE etc

## Maybe we will need citations for these, maybe not

MDFILE="RopeTemplate.md"
WDFILE="$OUTDIR/RopeTemplate.$NOW.docx"
pandoc $MDFILE -o $WDFILE  --bibliography $BIBLIOFILE  $FILTERS --citeproc --csl $BIBSTYLE --reference-doc=$TEMPLATE && echo "Generated $WDFILE"

MDFILE="TwoPagePICV.md"
WDFILE="$OUTDIR/TwoPagePICV.$NOW.docx"
pandoc $MDFILE -o $WDFILE  --bibliography $BIBLIOFILE  $FILTERS --citeproc --csl $BIBSTYLE --reference-doc=$TEMPLATE && echo "Generated $WDFILE"

