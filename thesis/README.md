# UCAS Thesis Quarto Template

这个目录是中国科学院大学学位论文 LaTeX 模板的 Quarto 封装版本。正文、摘要、附录和后置材料可以在 `.qmd` 文件中编辑；封面字段保留在 `frontinfo.tex` 中，以复用原模板的封面命令。

## 文件入口

- `_quarto.yml`：Quarto book 项目配置，RStudio 打开本目录后会识别。
- `frontinfo.tex`：中英文封面信息。
- `index.qmd`：中文摘要、英文摘要、目录、图表目录、符号列表。
- `chapters/*.qmd`：正文各章。
- `references.qmd`：参考文献与附录切换。
- `appendices/*.qmd`：附录。
- `backmatter.qmd`：致谢、作者简历、成果列表。
- `Biblio/ref.bib`：参考文献库；正文中使用 `\citep{key}` 等原模板引用命令。

## 渲染

在 PowerShell 或 RStudio Terminal 中运行：

```powershell
.\render.ps1
```

这个脚本会把 Quarto 的本地缓存临时放到本项目的 `.localappdata` 目录，避免访问 Windows 用户目录时遇到权限问题。

## 环境要求

需要安装：

- Quarto
- 能提供 `xelatex`、`biber`、`latexmk` 的 TeX 发行版，例如 TinyTeX、TeX Live 或 MiKTeX

当前项目已能走到 PDF 渲染阶段；如果系统找不到 `xelatex`，需要先安装 TeX 发行版并把其 `bin` 目录加入 PATH。
