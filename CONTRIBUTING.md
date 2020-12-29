# 维护指南

欢迎地震学入门教程的用户参与到教程的维护与更新中。

## 维护与更新

教程的维护与更性主要包括几个方面：

- 修正错别字、语句不通等
- 修正教程中的错误或不清晰的描述
- 修正reST文件语法错误导致的显示问题
- 调整章节结构，使得教程条理更清晰
- 建议、编写或者整理其他地震学入门基础的教程

可以通过如下几种方式参与教程的维护：

1. 通过 GitHub 修改教程源码并[提交 Pull Request](https://github.com/seismo-learn/seismology101/pulls)
2. 在 GitHub 上[提交 Issue](https://github.com/seismo-learn/seismology101/issues)
3. 在 [GitHub Discussions](https://github.com/seismo-learn/seismology101/discussions) 留言

## 分支模型

项目中存在如下长期分支：

- `main`: 主分支，对应最新版本的教程
- `gh-pages`: 存放网页的分支，自动更新，无需人工修改

其它分支均属于短期分支，在合并到 `main` 分支后会删除。

## 教程风格

### 新增章节

每个源文件都会被转换成一个单独的网页。因而，确定文件名时应慎重，一旦确定，尽量不要再改动。
由于Windows不区分文件名大小写，故而 option-B.rst 和 option-b.rst 在 Windows 下会出现冲突。
