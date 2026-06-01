# Thesis Writing Guide

This directory contains the working Quarto dissertation project. Open the repository-level `.Rproj` in RStudio, then edit and render files inside this `thesis/` directory.

## Quick commands

From the repository root:

```powershell
quarto render thesis
quarto render thesis --to docx
```

From this directory:

```powershell
quarto render
quarto render --to docx
```

Outputs are written to:

```text
thesis/_output/
```

The PDF is the formal UCAS-style output. The DOCX output is intended only as a draft for reading, comments, and supervisor feedback.

## File map

```text
thesis/
├── _quarto.yml
├── index.qmd
├── frontinfo.tex
├── references.qmd
├── backmatter.qmd
├── chapters/
├── appendices/
├── examples/
├── Biblio/
├── Img/
├── Style/
├── Tex/
└── _extensions/ucasthesis/
```

## What to edit

### `frontinfo.tex`

Use this file for cover-page metadata:

- Chinese thesis title;
- English thesis title;
- author;
- supervisor;
- degree level;
- degree type;
- major;
- institute;
- date.

This file intentionally remains LaTeX because the UCAS class uses custom commands for the cover pages.

### `index.qmd`

Use this file for front matter:

- Chinese abstract;
- Chinese keywords;
- English abstract;
- English keywords;
- table of contents;
- lists of figures and tables;
- symbol list.

The table of contents and lists of figures/tables are currently controlled by raw LaTeX blocks because they follow the original UCAS template logic.

### `chapters/*.qmd`

Use this directory for main dissertation chapters. Each top-level heading becomes a chapter:

```markdown
# Introduction

## Research Background

Text...
```

### `references.qmd`

This file prints the bibliography and switches the document into appendix mode. Most users do not need to edit it unless changing the bibliography or appendix structure.

### `appendices/*.qmd`

Use this directory for appendix chapters.

### `backmatter.qmd`

Use this file for:

- acknowledgements;
- author biography;
- publications;
- patents;
- projects and awards.

## Adding or removing chapters

Create a new chapter file:

```text
chapters/05-results.qmd
```

Then register it in `_quarto.yml`:

```yaml
book:
  chapters:
    - index.qmd
    - chapters/01-introduction.qmd
    - chapters/02-methods.qmd
    - chapters/03-conclusion.qmd
    - chapters/04-quina-example.qmd
    - chapters/05-results.qmd
    - references.qmd
    - appendices/appendix-a.qmd
    - backmatter.qmd
```

The order in `_quarto.yml` is the order in the final document.

## Figures

Put figure files in:

```text
Img/
```

For simple figures, Markdown is enough:

```markdown
![Sample figure](../Img/c06h06.png){#fig-sample width=40%}
```

For formal UCAS-style bilingual captions, use raw LaTeX:

```tex
\begin{figure}[!htbp]
    \centering
    \includegraphics[width=0.40\textwidth]{c06h06}
    \bicaption{\enspace 中文图题}{\enspace English caption}
    \fignote{Figure note}
    \label{fig:sample}
\end{figure}
```

The `Style/artratex.sty` file sets the graphic search path to `Img/`, so LaTeX figures can usually refer to image basenames directly.

## Tables

For quick drafts, use Markdown tables:

```markdown
| Variable | Description |
|---|---|
| A | Example |
```

For final dissertation formatting, raw LaTeX tables are often more reliable:

```tex
\begin{table}[!htbp]
    \bicaption{\enspace 中文表题}{\enspace English table caption}
    \label{tab:sample}
    \centering
    \begin{tabular}{ll}
        \hline
        Variable & Description \\
        \hline
        A & Example \\
        \hline
    \end{tabular}
\end{table}
```

## References

Add BibTeX entries to:

```text
Biblio/ref.bib
```

### Recommended Zotero workflow

The recommended workflow is:

1. Install Zotero.
2. Install the Zotero plugin **Better BibTeX**.
3. Create a Zotero collection for the dissertation.
4. Right click the collection and choose **Export Collection...**.
5. Choose **Better BibLaTeX** or **Better BibTeX**.
6. Enable **Keep updated**.
7. Export to:

```text
Biblio/ref.bib
```

After this setup, Zotero becomes the reference manager and `Biblio/ref.bib` becomes the automatically updated bibliography database used by Quarto/XeLaTeX.

### Citation syntax in `.qmd`

Use Pandoc/Quarto citation syntax:

```markdown
The Longtan assemblage has been interpreted as a Quina techno-complex [@ruan2025quina].

@ruan2025quina provides a detailed technological reconstruction.
```

For the UCAS PDF format, the template converts these citation forms to LaTeX:

```text
[@key]  -> \citep{key}
@key    -> \citet{key}
```

This lets you write in a Zotero-friendly Quarto style while still using the UCAS LaTeX bibliography backend.

You can also use the original UCAS citation commands directly:

```tex
\citep{lamport1986document}
\citet{lamport1986document}
```

The PDF workflow uses:

- `biblatex`;
- `biber`;
- GB/T 7714 bibliography styles in `Biblio/`.

If Biber reports `Found 0 citekeys`, it usually means no `\citep{...}` or `\citet{...}` commands have been used yet.

Do not manually type fixed numbered citations such as `[1]`, `[2]`, or `[3]` in new writing. Those numbers will not update automatically when references are added, deleted, or reordered. If a Word manuscript contains fixed numbered references, treat them as a temporary migration state and replace them with citation keys.

## Equations

Inline math:

```markdown
The value is $E = mc^2$.
```

Display math:

```markdown
$$
E = mc^2
$$
```

For numbered equations and UCAS-compatible cross references, use LaTeX:

```tex
\begin{equation}\label{eq:sample}
    E = mc^2
\end{equation}
```

Then refer to it with:

```tex
\eqref{eq:sample}
```

## Worked example

The example file:

```text
chapters/04-quina-example.qmd
```

was adapted from a Word manuscript and rewritten as a dissertation-style chapter. It shows how to migrate:

- article prose into thesis chapter prose;
- fixed numbered references into Zotero/Better BibTeX citation keys;
- Word figure references such as `（图2）` into `图 \ref{fig:hominin-dispersal}`;
- pasted figure captions into UCAS-style `figure`, `\bicaption`, `\fignote`, and `\label` blocks.

The extracted figures are in:

```text
Img/example-quina/
```

This example is registered in `_quarto.yml`, so it is part of the default dissertation render. Remove it from `_quarto.yml` when you start a real dissertation draft and no longer want the sample chapter in the output.

## PDF and DOCX outputs

### Formal PDF

```powershell
quarto render thesis
```

or, from inside `thesis/`:

```powershell
quarto render
```

This uses the custom `ucasthesis-pdf` format and XeLaTeX.

### Draft DOCX

```powershell
quarto render thesis --to docx
```

The DOCX output is useful for comments and collaborative reading. It does not reproduce the official UCAS LaTeX layout and may ignore raw LaTeX-only elements.

## Recommended writing routine

1. Open the `.Rproj` in RStudio.
2. Edit `frontinfo.tex`.
3. Draft abstract and keywords in `index.qmd`.
4. Write chapter content in `chapters/*.qmd`.
5. Add figures to `Img/` and references to `Biblio/ref.bib`.
6. Render the PDF frequently with `quarto render thesis`.
7. Export DOCX drafts when feedback is needed.
8. Commit source changes with Git.

## Troubleshooting

### Missing TeX command

Check:

```powershell
where xelatex
where biber
where latexmk
```

### Missing LaTeX package

Install manually if TinyTeX does not install it automatically:

```powershell
tlmgr install package-name
```

### PowerShell blocks `render.ps1`

Use:

```powershell
quarto render thesis
```

### Generated files appear in Git

Check `.gitignore`. Build products such as `_output/`, `.quarto/`, `.aux`, `.log`, `.bbl`, and `.bcf` should not be committed.
