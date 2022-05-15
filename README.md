# md2arc
Writing grants with markdown and pandoc (yet still submit compliant docx files)

## Introduction

The ARC now demands an audit trail for files uploaded to RMS to show that they are compliant with the formatting rules. Although they claim $TeX$ files should be ok, there are no `.sty` files that we can use.

So here's an alternative:

- Write in `markdown`
- References in `bibtex` or `CSL json` format using pandoc `citeproc`
- Cross references of equations and figures using pandoc `crossref`
- *optional* — use `mermaid` to add gantt charts etc (at your own risk ... may not be compliant)


## Instructions

Install the dependencies (See below). Run the file `build-docs.sh` from the command line. Check the `GeneratedFiles` folder where the templates land up. Customise `build-docs.sh` , switch out the bibliography file. 

The generated files are the word documents for each section you choose to build. They obey the ARC template file (supplied) and should format the markdown nicely. You do need to use word to tweak things like page-breaks and figure sizes, and to convert the `.docx` files to `.pdf` files (because if you use pandoc for that the audit trail breaks).

**Then just write your proposal !** 

There are a few things to watch out for. The template headings are for discovery projects and vary scheme-by-scheme, year by year. The layout requirements may change (usually not), in which case the file `ARC-template.docx` will need updating. It's Github, so raise an issue for help !

## Requirements

- `pandoc`
- `pandoc-crossref`
- `mermaid` (optional *if you love gantt charts written in code*)
