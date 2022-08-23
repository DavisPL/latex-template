# latex-tools

A LaTeX repository template with smarter build scripts.

Includes functionality for:
- spellchecking and maintaining a project-specific whitelist under version control (`make spellcheck`);
- building the PDF with bibtex, filtering out all output aside from warnings and errors (`make`); and
- building various auxiliary data (`make aux`) including a wordcloud, summary statistics, and a list of unused bibliography entries.

## To Use

Clone this repository. Then include your LaTeX source files under `src/`. Run `make` to view the PDF, `make clean` to clean up, or `make full` to build the final version including spellcheck and auxiliary data. Check out `Makefile` for details about these options.

## Dependencies

You should have a full distribution of TeX Live installed (e.g. `texlive-full`), which ships with some auxiliary command line tools. Run the following to make sure everything is installed:
```
pdflatex -v
texfot -v
checkcites -v
```

Building the wordclouds requires the [`wordcloud_cli` Python tool](https://github.com/amueller/word_cloud). To install:
```
pip install wordcloud
```

## Why does this repository exist?

This repository mainly serves to put all of the scripts related to my LaTeX workflow in one place. Many other LaTeX build systems exist; I've used `latexmk`, but found it frustrating and feature-incomplete, and it doesn't include a bunch of the other auxiliary functionality here.

For example, with this repository I'm maintaining a common spellcheck whitelist under version control (with CS-specific words); see `data/.aspell.en.pws`.
Also, this repository enforces a separation between source files (`src/`), build files (`build/`), and auxiliary data (i.e., build script inputs and outputs) which is maintained under version control (`data/`).

I created most of the scripts (`scripts/`) while working on my dissertation, and I will be using and updating this repository for future LaTeX projects.

## Issues

If you use this repository as a template for your LaTeX project, I would love to hear about bugs or feature requests. Please file an issue!
