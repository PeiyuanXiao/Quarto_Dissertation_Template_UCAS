# Examples

This directory contains example source files converted from real academic writing.

## Thesis-style Quina example

The worked example is included directly as a dissertation chapter:

```text
../chapters/04-quina-example.qmd
```

It was adapted from a Chinese article manuscript on Middle Paleolithic Quina technology in Yunnan and the discussion of Neanderthals in China.

It demonstrates:

- how to turn article prose into dissertation chapter prose;
- how to remove article-only title, author, abstract, and keyword blocks;
- how to use numbered headings through Quarto chapter/section structure;
- how to use Zotero/Better BibTeX citation keys such as `[@ruan2025quina]`;
- how to include UCAS-style bilingual figure captions and cross references using LaTeX.

Because it is registered in `../_quarto.yml`, it is rendered as part of the formal thesis PDF/DOCX when you run:

```powershell
quarto render thesis
```

Do not render files in this `examples/` directory directly unless you intentionally want a standalone preview.
