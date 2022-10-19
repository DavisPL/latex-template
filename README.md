# latex-tools

A LaTeX template repository with batteries included for cleaner builds, spellchecking, BibTeX checks, and summary statistics.

## To use

After cloning the respository, run `make` to compile and view the PDF or `make full` for a more comprehensive build (intended to be run less frequently for publishable versions).

- The basic build generates the PDF while filtering out all output aside from warnings and errors.

- The comprehensive build also runs a spellcheck, maintaining a whitelist specific to your project (`make spellcheck`); and it produces various auxiliary data and checks (`make aux`), including a list of unused references, a check for correctly embedded fonts, summary statistics, and wordclouds.
By default, all of these auxiliary data including the spellcheck whitelist are under version control so that they can be tracked and published with major versions of the document.

## Requirements

This repository has been tested on Mac and Linux.
You will need a full distribution of TeX Live (e.g. `texlive-full`), which ships with some auxiliary command line tools. Run the following to make sure everything is installed:
```
pdflatex -v
texfot -v
checkcites -v
```

If you want the wordclouds, you will need the [`wordcloud_cli` Python tool](https://github.com/amueller/word_cloud). To install:
```
pip install wordcloud
```

## Why does this repository exist?

This repository mainly serves to put all of the scripts related to my LaTeX workflow in one place. Many other LaTeX build systems exist; I've used `latexmk`, but found it frustrating and feature-incomplete, and it doesn't include a bunch of the other auxiliary functionality here. Overleaf is much easier to use, but frustrating for concurrent editing as it lacks a nicely packaged list of each coauthors changes under a version control system.
I created most of the scripts (`scripts/`) while working on my dissertation, and I will be using and updating this repository for future LaTeX projects.

The repository enforces a separation between source files (`src/`), build files (`build/`), and auxiliary data (`/data`, i.e., build script inputs and outputs).
The whitelist shipped with the repository in `data/.aspell.en.pws` includes lots of CS-specific words.

## Known limitations

It is currently necessary for the main file to be `main.tex` and for there to be a single references file named `ref.bib` (as in the template `src/`).
Other configurations (e.g. multiple bibliographies `multibib`) aren't supported yet.

The Makefile doesn't attempt to optimize the build for performance, so may not be appropriate for a larger project like a book.
When pdflatex fails, `make` should exit gracefully (if not, it's a bug) but you may still have to go into build/ and run pdflatex to get the error message. This may also mess up the build state so that you have to run `make clean` before building again.

## Issues

If you use this repository as a template for your LaTeX project, I would love to hear about what worked and what didn't. Please file an issue.
