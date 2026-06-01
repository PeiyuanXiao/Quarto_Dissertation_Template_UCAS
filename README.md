# Quarto Dissertation Template for UCAS

这是一个面向 **中国科学院大学（UCAS）学位论文** 的 Quarto/RStudio 写作模板。项目基于中国科学院大学学位论文 LaTeX 模板整理而来，保留原模板的封面、声明页、页眉页脚、图表目录、参考文献样式等 LaTeX 排版逻辑，同时把正文写作入口迁移到 Quarto `.qmd` 文件，便于在 RStudio 中编辑、预览和版本管理。

本模板的目标是：

- 用 RStudio/Quarto 编写学位论文正文；
- 复用 UCAS LaTeX 模板的正式版式；
- 支持中文论文、英文摘要、图表目录、附录、致谢、作者简历和 GB/T 7714 参考文献；
- 避免把 LaTeX 编译产物提交到 Git 仓库。

## 项目结构

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
    │   ├── ref.bib
    │   └── gb7714 / gbt7714 样式文件
    ├── Img/
    │   └── 图片与校徽资源
    ├── Style/
    │   ├── ucasthesis.cls
    │   ├── ucasthesis.cfg
    │   ├── artratex.sty
    │   └── artracom.sty
    ├── Tex/
    │   └── figuretable.tex
    └── _extensions/
        └── ucasthesis/
            ├── _extension.yml
            ├── template.tex
            ├── preamble.tex
            └── partials/
```

## 主要文件说明

### RStudio 项目

- `Quarto_Dissertation_Template_UCAS.Rproj`  
  RStudio 项目文件。建议从这个文件打开项目。

### Quarto 论文项目

- `thesis/_quarto.yml`  
  Quarto book 项目配置。章节顺序、输出目录和 UCAS PDF 格式都在这里配置。

- `thesis/index.qmd`  
  论文前置部分，包括中文摘要、英文摘要、关键词、目录、图表目录和符号列表。正文开始前的 `\mainmatter` 也在这里切换。

- `thesis/chapters/*.qmd`  
  正文章节。默认提供绪论、方法、结论三个示例章节，可按实际论文结构增删。

- `thesis/references.qmd`  
  参考文献输出和附录切换入口。当前模板使用原 UCAS LaTeX 模板的 `biblatex + biber + GB/T 7714` 方案。

- `thesis/appendices/*.qmd`  
  附录内容。

- `thesis/backmatter.qmd`  
  致谢、作者简历、攻读学位期间成果等后置内容。

- `thesis/frontinfo.tex`  
  中英文封面信息，包括题目、作者、导师、学位、专业、培养单位、日期等。写作前应优先修改这里。

### LaTeX 模板资源

- `thesis/Style/`  
  UCAS 模板核心 LaTeX 类和样式文件。`artratex.sty` 已针对 Quarto/TinyTeX 编译环境做了兼容调整。

- `thesis/Biblio/ref.bib`  
  参考文献数据库。正文中使用 `\citep{key}` 等原模板引用命令。

- `thesis/Img/`  
  图片资源目录。校徽 `ucas_logo.pdf` 位于这里。

- `thesis/_extensions/ucasthesis/`  
  Quarto 自定义格式扩展。它负责把 Quarto 输出接入 UCAS LaTeX 模板。

- `中国科学院大学学位论文LaTeX模板/`  
  原始 LaTeX 模板备份，便于对照和追溯。

## 环境要求

建议使用：

- RStudio
- Quarto
- TinyTeX、TeX Live 或 MiKTeX
- Git

PDF 编译至少需要以下命令可用：

```powershell
where quarto
where xelatex
where biber
where latexmk
```

如果缺少 TeX 工具链，可在 R 中安装 TinyTeX：

```r
install.packages("tinytex")
tinytex::install_tinytex()
tinytex::tlmgr_path()
```

第一次渲染时，TinyTeX 可能会自动安装缺失的 LaTeX 包。这是正常现象。

## 使用方式

### 1. 打开项目

用 RStudio 打开：

```text
Quarto_Dissertation_Template_UCAS.Rproj
```

### 2. 渲染 PDF

在 RStudio Terminal 或 PowerShell 中，从仓库根目录运行：

```powershell
quarto render thesis
```

也可以进入 `thesis/` 后运行：

```powershell
quarto render
```

如果 PowerShell 执行策略允许，也可以使用：

```powershell
.\thesis\render.ps1
```

渲染成功后，PDF 位于：

```text
thesis/_output/中国科学院大学学位论文.pdf
```

### 3. 修改封面信息

编辑：

```text
thesis/frontinfo.tex
```

重点修改：

- 中文题目与英文题目；
- 作者姓名；
- 导师姓名、职称、单位；
- 学位级别与学位类别；
- 专业名称；
- 培养单位；
- 毕业日期。

### 4. 编写正文

正文使用 `.qmd` 文件：

```text
thesis/chapters/01-introduction.qmd
thesis/chapters/02-methods.qmd
thesis/chapters/03-conclusion.qmd
```

新增章节时，例如添加 `04-results.qmd`：

1. 在 `thesis/chapters/` 中创建文件；
2. 在 `thesis/_quarto.yml` 的 `book.chapters` 中加入：

```yaml
- chapters/04-results.qmd
```

### 5. 插入图片

建议把图片放入：

```text
thesis/Img/
```

Markdown 图片示例：

```markdown
![样图](../Img/c06h06.png){#fig-sample width=40%}
```

如果需要 UCAS 模板的双语图题、图注或复杂子图，建议使用原生 LaTeX：

```tex
\begin{figure}[!htbp]
    \centering
    \includegraphics[width=0.40\textwidth]{c06h06}
    \bicaption{\enspace 样图}{\enspace Sample Figure}
    \fignote{对图片的注释}
    \label{fig:sample}
\end{figure}
```

### 6. 参考文献

参考文献写入：

```text
thesis/Biblio/ref.bib
```

正文中引用：

```tex
\citep{lamport1986document}
```

当前模板沿用原 UCAS 模板的 `biblatex + biber + GB/T 7714` 设置。渲染时 Quarto 会调用 `biber` 生成参考文献。

## Git 使用建议

本仓库已忽略以下编译或本地状态文件：

- `.Rproj.user/`
- `.Rhistory`
- `thesis/.quarto/`
- `thesis/.localappdata/`
- `thesis/_output/`
- LaTeX 编译中间文件，如 `.aux`、`.bbl`、`.bcf`、`.log`、`.toc` 等

建议提交源文件：

- `.qmd`
- `.tex`
- `.yml`
- `.bib`
- 模板样式文件
- 图片资源

不建议提交自动生成的 PDF 和 LaTeX 中间文件，除非需要发布正式版本。

## 常见问题

### 找不到 `xelatex`

确认 TeX 发行版已安装，并且 `xelatex` 在 PATH 中：

```powershell
where xelatex
```

### 缺少 `.sty` 文件

TinyTeX 通常会自动安装缺失包。也可以手动安装，例如：

```powershell
tlmgr install mathtools
```

### 字体报错

模板已将 Windows 中文字体分支调整为 TeX Live/TinyTeX 自带的 Fandol 字体，以提高可复现性。如果仍有字体问题，优先确认 TinyTeX 字体包是否完整。

### PowerShell 不允许运行 `render.ps1`

可以不用脚本，直接运行：

```powershell
quarto render thesis
```

## 许可证与来源

本项目基于中国科学院大学学位论文 LaTeX 模板整理为 Quarto/RStudio 写作模板。原模板文件保留在 `中国科学院大学学位论文LaTeX模板/` 中，便于对照。使用本模板时请自行核对所在院系、学科群和当年学位论文撰写规范的最新要求。
