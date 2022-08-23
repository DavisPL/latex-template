# latex-tools

A LaTeX repository template with smarter build scripts.

Includes functionality for:
- spellchecking and maintaining a project-specific whitelist under version control (`make spellcheck`);
- building the PDF with bibtex, filtering out all output aside from warnings and errors (`make`); and
- building various auxiliary data (`make aux`) including a wordcloud, summary statistics, and a list of unused bibliography entries.

## To Use

Clone this repository. Then include your LaTeX source files under `src/`. Run `make` to view the PDF, `make clean` to clean up, or `make full` to build the final version including spellcheck and auxiliary data. Check out `Makefile` for details about these options.

## Bugs

If you use this repository as a template for your LaTeX project, I would love to hear about bugs. Please file an issue.
