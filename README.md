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

## Issues

If you use this repository as a template for your LaTeX project, I would love to hear about bugs or feature requests. Please file an issue!
