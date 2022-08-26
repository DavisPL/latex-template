# latex-tools

A LaTeX repository template with smarter build scripts.

Includes functionality for:
- spellchecking with a project-specific whitelist maintained under version control (`make spellcheck`);
- building the PDF while filtering out all output aside from warnings and errors (`make`); and
- building auxiliary data (`make aux`) including a wordcloud, summary statistics, a check for correctly embedded fonts, and a list of unused bibliography entries.

## To use

1. Clone this repository.
2. Modify the LaTeX source files under `src/` (or include your own).
3. Run `make` to build only the PDF, or `make full` to build the PDF and all auxiliary data.

This does the following:
- Spellchecks the input files, updating the whitelist in `data/.aspell.en.pws`.
- Produces the size of all input files in `data/totals.txt`.
- Produces curated wordclouds for your LaTeX project in `data/wordcloud.png` and `data/wordcloud_refs.png`.
- Produces bibliography stats (including unused refs) in `data/bibentries.txt` and `data/bibunused.txt`.
- Produces the PDF in `build/main.pdf`.

Check out `Makefile` for more specific options.

## Dependencies

This repository has been tested on Mac and Linux.
You will need a full distribution of TeX Live (e.g. `texlive-full`), which ships with some auxiliary command line tools. Run the following to make sure everything is installed:
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

## Known limitations

It is currently necessary for the main file to be `main.tex` and for there to be a single references file named `ref.bib` (as in the template `src/`).
Other configurations (e.g. multiple bibliographies `multibib`) aren't supported yet.

The Makefile doesn't attempt to optimize the build for performance, so may not be appropriate for a larger project like a book.
When pdflatex fails, `make` should exit gracefully (if not, it's a bug) but you may still have to go into build/ and run pdflatex to get the error message. This may also mess up the build state so that you have to run `make clean` before building again.

## Issues

If you use this repository as a template for your LaTeX project, I would love to hear about bugs or feature requests. Please file an issue!
