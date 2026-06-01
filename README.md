<samp>DISSERTATION TEMPLATE</samp>

<h1><b><i>Quarto Dissertation Template for the University of Chinese Academy of Sciences</i></b></h1>

<hr />

[![Project Status: Active](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![Quarto](https://img.shields.io/badge/Quarto-PDF-blue.svg)](https://quarto.org/)
[![RStudio](https://img.shields.io/badge/RStudio-ready-75AADB.svg)](https://posit.co/products/open-source/rstudio/)
[![TeX engine: XeLaTeX](https://img.shields.io/badge/TeX-XeLaTeX-lightgrey.svg)](https://tug.org/xetex/)

This repository provides a **Quarto/RStudio dissertation writing template** for students at the **University of Chinese Academy of Sciences (UCAS)**.

It wraps the official UCAS LaTeX thesis style in a Quarto project, so the dissertation can be written in `.qmd` files while preserving the original LaTeX layout for the cover pages, declaration, page headers, table of contents, lists of figures and tables, appendices, acknowledgements, and GB/T 7714 bibliography formatting.

The template is designed for authors who want:

- a familiar RStudio + Quarto writing workflow;
- UCAS-style PDF output through XeLaTeX;
- chapter-based `.qmd` source files;
- BibLaTeX/Biber references using GB/T 7714 styles;
- a Git-friendly project layout that keeps build products out of version control.

------------------------------------------------------------------------

### 👤 Maintainer

**Pei-yuan Xiao**  
University of Chinese Academy of Sciences

Repository: <https://github.com/PeiyuanXiao/Quarto_Dissertation_Template_UCAS>

------------------------------------------------------------------------

### 📝 What this template contains

This project contains two parallel resources:

1.  A working **Quarto dissertation project** in [`thesis/`](thesis/).
2.  A preserved copy of the original UCAS LaTeX template in [`中国科学院大学学位论文LaTeX模板/`](中国科学院大学学位论文LaTeX模板/), kept for comparison and traceability.

The working Quarto project has already been adapted for a Windows + TinyTeX + RStudio workflow. It uses a custom Quarto extension in `thesis/_extensions/ucasthesis/` to connect Pandoc/Quarto output with the UCAS LaTeX class.

------------------------------------------------------------------------

### 📁 Contents

```text
Quarto_Dissertation_Template_UCAS/
├── Quarto_Dissertation_Template_UCAS.Rproj
├── README.md
├── .gitignore
├── 0601考古学-中国科学院大学研究生学位论文撰写具体要求.doc
├── 中国科学院大学学位论文LaTeX模板/
└── thesis/
    ├── _quarto.yml
    ├── index.qmd
    ├── frontinfo.tex
    ├── references.qmd
    ├── backmatter.qmd
    ├── render.ps1
    ├── README.md
    ├── chapters/
    │   ├── 01-introduction.qmd
    │   ├── 02-methods.qmd
    │   └── 03-conclusion.qmd
    ├── appendices/
    │   └── appendix-a.qmd
    ├── Biblio/
    ├── Img/
    ├── Style/
    ├── Tex/
    └── _extensions/
        └── ucasthesis/
```

#### Key files

- [:file_folder: `thesis/`](thesis/) — the main Quarto dissertation project.

- [`thesis/_quarto.yml`](thesis/_quarto.yml) — the Quarto book configuration. This controls chapter order, output directory, and the custom `ucasthesis-pdf` format.

- [`thesis/frontinfo.tex`](thesis/frontinfo.tex) — Chinese and English cover-page metadata, including title, author, supervisor, degree, major, institute, and date.

- [`thesis/index.qmd`](thesis/index.qmd) — front matter, including Chinese abstract, English abstract, keywords, table of contents, lists of figures and tables, and symbol list.

- [:file_folder: `thesis/chapters`](thesis/chapters) — main dissertation chapters written in Quarto Markdown.

- [`thesis/references.qmd`](thesis/references.qmd) — bibliography output and appendix transition.

- [:file_folder: `thesis/appendices`](thesis/appendices) — appendix chapters.

- [`thesis/backmatter.qmd`](thesis/backmatter.qmd) — acknowledgements, author biography, publications, patents, projects, and awards.

- [:file_folder: `thesis/Biblio`](thesis/Biblio) — BibTeX database and GB/T 7714 bibliography style files.

- [:file_folder: `thesis/Style`](thesis/Style) — UCAS LaTeX class and style files. These are responsible for most of the official thesis layout.

- [:file_folder: `thesis/_extensions/ucasthesis`](thesis/_extensions/ucasthesis) — custom Quarto extension that connects Quarto output to the UCAS LaTeX template.

------------------------------------------------------------------------

### 🚀 How to use

#### 1. Clone the repository

```sh
git clone https://github.com/PeiyuanXiao/Quarto_Dissertation_Template_UCAS.git
cd Quarto_Dissertation_Template_UCAS
```

#### 2. Open the RStudio project

Open:

```text
Quarto_Dissertation_Template_UCAS.Rproj
```

This keeps the project root stable when working in RStudio.

#### 3. Check the required tools

In the RStudio Terminal or PowerShell, check that Quarto and the TeX tools are available:

```powershell
where quarto
where xelatex
where biber
where latexmk
```

If the TeX tools are missing, install TinyTeX from R:

```r
install.packages("tinytex")
tinytex::install_tinytex()
tinytex::tlmgr_path()
```

#### 4. Render the PDF

From the repository root:

```powershell
quarto render thesis
```

Alternatively, enter the thesis directory first:

```powershell
cd thesis
quarto render
```

If your PowerShell execution policy allows local scripts, you can also run:

```powershell
.\thesis\render.ps1
```

The rendered PDF is written to:

```text
thesis/_output/中国科学院大学学位论文.pdf
```

> **Note:** On the first render, TinyTeX may install missing LaTeX packages automatically. This is expected.

------------------------------------------------------------------------

### ✍️ Writing workflow

#### Edit the cover information

Update:

```text
thesis/frontinfo.tex
```

This file controls the Chinese and English cover pages. Edit the thesis title, author, supervisor, degree, degree type, major, institute, and submission date.

#### Write the abstracts and front matter

Edit:

```text
thesis/index.qmd
```

This file contains:

- Chinese abstract;
- English abstract;
- Chinese and English keywords;
- table of contents;
- lists of figures and tables;
- symbol list.

#### Write the main chapters

Edit or add files in:

```text
thesis/chapters/
```

The default chapter files are:

```text
01-introduction.qmd
02-methods.qmd
03-conclusion.qmd
```

To add a new chapter, create a new `.qmd` file, for example:

```text
thesis/chapters/04-results.qmd
```

Then register it in [`thesis/_quarto.yml`](thesis/_quarto.yml):

```yaml
book:
  chapters:
    - index.qmd
    - chapters/01-introduction.qmd
    - chapters/02-methods.qmd
    - chapters/03-conclusion.qmd
    - chapters/04-results.qmd
    - references.qmd
    - appendices/appendix-a.qmd
    - backmatter.qmd
```

#### Write appendices and back matter

- Appendices: [`thesis/appendices/`](thesis/appendices/)
- Acknowledgements and academic record: [`thesis/backmatter.qmd`](thesis/backmatter.qmd)

------------------------------------------------------------------------

### 🖼️ Figures and tables

Store figures in:

```text
thesis/Img/
```

Simple Markdown figure:

```markdown
![Sample figure](../Img/c06h06.png){#fig-sample width=40%}
```

For UCAS-style bilingual captions, figure notes, or complex subfigures, use raw LaTeX:

```tex
\begin{figure}[!htbp]
    \centering
    \includegraphics[width=0.40\textwidth]{c06h06}
    \bicaption{\enspace 样图}{\enspace Sample Figure}
    \fignote{Notes for this figure}
    \label{fig:sample}
\end{figure}
```

Tables can be written in Markdown, Quarto, or raw LaTeX. For final dissertation formatting, raw LaTeX tables may offer the most precise control.

------------------------------------------------------------------------

### 📚 References

Add references to:

```text
thesis/Biblio/ref.bib
```

The template currently follows the original UCAS LaTeX bibliography setup:

- `biblatex`;
- `biber`;
- GB/T 7714 bibliography styles.

Use LaTeX citation commands in the `.qmd` files:

```tex
\citep{lamport1986document}
```

After rendering, `biber` is called automatically by Quarto.

------------------------------------------------------------------------

### 💻 Computational environment

The template has been tested with:

| Component | Role |
|---|---|
| RStudio | editing environment |
| Quarto | document project and rendering workflow |
| XeLaTeX | PDF engine |
| Biber | bibliography processor |
| TinyTeX / TeX Live | LaTeX package system |
| Git | version control |

Useful checks:

```powershell
quarto --version
where xelatex
where biber
where latexmk
```

------------------------------------------------------------------------

### 📤 Outputs

The main output is:

```text
thesis/_output/中国科学院大学学位论文.pdf
```

Build products are intentionally ignored by Git, including:

- `thesis/_output/`;
- `thesis/.quarto/`;
- `thesis/.localappdata/`;
- LaTeX auxiliary files such as `.aux`, `.bbl`, `.bcf`, `.log`, `.toc`, `.lof`, and `.lot`.

This keeps the repository focused on source files rather than generated files.

------------------------------------------------------------------------

### 🧰 Troubleshooting

#### `xelatex` is not found

Install TinyTeX or another TeX distribution, then verify:

```powershell
where xelatex
```

#### A `.sty` file is missing

TinyTeX often installs missing packages automatically. You can also install them manually:

```powershell
tlmgr install mathtools
```

#### PowerShell refuses to run `render.ps1`

Use Quarto directly:

```powershell
quarto render thesis
```

#### Font errors

The template has been adjusted to use Fandol Chinese fonts from TeX Live/TinyTeX in the Windows branch of the UCAS style file. If font errors persist, update TinyTeX packages:

```powershell
tlmgr update --self --all
```

------------------------------------------------------------------------

### 📄 Notes on licensing and template source

This repository adapts the UCAS LaTeX thesis template into a Quarto/RStudio workflow. The original LaTeX template files are preserved in:

```text
中国科学院大学学位论文LaTeX模板/
```

Please check the latest UCAS, institute, and discipline-specific dissertation requirements before final submission. This project is a working template, not an official university release.
