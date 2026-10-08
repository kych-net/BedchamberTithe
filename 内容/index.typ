// 文档入口:编译本文件即得完整文档(PDF 或 HTML)。
// 正文分文件放在 内容/ 下,标题层级直接用 = / == …,由 #include 合并进来。
// 各章自带 #import "…/配置.typ": *(模板成员经它再导出)。
// / Entry point: compile this file for the whole document. Chapters live in
// separate files under 内容/ and are merged with #include.
#import "../配置.typ": *
#import "@preview/cmarker:0.1.10": render
#import "@preview/mitex:0.2.7": mitex

#show: 网页模板

#outline(title: "目录")

#render(
  read("../README.md"),
  h1-level: 1,          // Markdown 的 # → Typst 的 =,与本节层级接上
  set-document-title: false,
  math: mitex,
  scope: (
    // Markdown 的 ![alt](src) → 带题注的 figure。
    // src 相对 README.md 解析,而这里在 内容/ 下,故补一级 ../。
    image: (source, alt: none, format: auto) => figure(
      image("../" + source, alt: alt, format: format, width: 100%),
      caption: alt,
    ),
  ),
) 

