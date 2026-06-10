# 地震“学”科研入门教程

[![Jupyter Book Badge](https://raw.githubusercontent.com/jupyter-book/jupyter-book/next/docs/media/images/badge.svg)](https://seismo-learn.org/seismology101/)
[![Build and Deploy](https://github.com/seismo-learn/seismology101/actions/workflows/build.yml/badge.svg)](https://github.com/seismo-learn/seismology101/actions/workflows/build.yml)
[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC%20BY--NC%204.0-blue.svg)](https://creativecommons.org/licenses/by-nc/4.0/deed.zh-hans)

本教程主要面向地震学新手，包括地震学专业的高年级本科生、低年级研究生以及
其他刚接触地震学的科研人员。

本教程的主要目的是帮助地震学新手快速入门，以尽快开展实际的科研工作。其既可以
作为地震学新手的入门自学材料，也可以作为地震学研究组的入门培训材料。

- 主页：https://seismo-learn.org/seismology101/
- 源码：https://github.com/seismo-learn/seismology101

## 本地构建

本教程使用 [Jupyter Book](https://jupyterbook.org/) 构建。推荐使用
[Miniforge](https://conda-forge.org/download/) 创建独立环境：

```bash
conda env create -f environment.yml
conda activate seismo-learn
```

构建网站：

```bash
make build
```

如果希望执行 Markdown/Notebook 中的代码单元并在页面中显示输出，请使用：

```bash
make build-execute
```

构建结果位于 `_build/` 目录。若需要清理构建文件，可执行：

```bash
make clean
```

## 文档维护

本文档尚有很多不完善之处，欢迎读者参与到文档的维护与更新中。
详情见[贡献指南](https://seismo-learn.org/contributing/)。

## 许可协议

本作品采用 [知识共享署名-非商业性使用 4.0 国际许可协议 (CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/deed.zh-hans) 。
任何人都可以自由地分享、修改本作品，但必须遵循如下条件：

- 署名：必须提到原作者，提供指向此许可协议的链接，表明是否有做修改
- 非商业性使用：不能对本作品进行任何形式的商业性使用
