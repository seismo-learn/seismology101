# 地震“学”科研入门教程

[![Jupyter Book Badge](https://raw.githubusercontent.com/jupyter-book/jupyter-book/next/docs/media/images/badge.svg)](https://seismo-learn.org/seismology101/)
[![Build and Deploy](https://github.com/seismo-learn/seismology101/actions/workflows/build.yml/badge.svg)](https://github.com/seismo-learn/seismology101/actions/workflows/build.yml)
[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC%20BY--NC%204.0-blue.svg)](https://creativecommons.org/licenses/by-nc/4.0/deed.zh-hans)

本教程主要面向地震学新手，包括地震学专业的高年级本科生、低年级研究生以及其他刚接触地震学
的科研人员。

本教程的主要目的是帮助地震学新手快速入门，以尽快开展实际的科研工作。其既可以作为地震学
新手的入门自学材料，也可以作为地震学研究组的入门培训材料。

- 主页：https://seismo-learn.org/seismology101/
- 源码：https://github.com/seismo-learn/seismology101

## 本地构建

本教程使用 [Jupyter Book](https://jupyterbook.org/) 构建。推荐使用
[Miniforge](https://conda-forge.org/download/) 创建独立环境：

```bash
conda env create -f environment.yml
conda activate seismo-learn
```

常用命令如下（直接执行 `make` 可查看所有命令）：

| 命令 | 说明 |
| --- | --- |
| `make html` | 构建网站，会执行代码单元 |
| `make serve` | 本地预览，同样会执行代码单元 |
| `make clean-html` | 清理构建的 HTML |
| `make clean-all` | 清理所有构建产物 |

构建结果位于 `source/_build/html/` 目录。

首次执行 `make html` 或 `make serve` 时会下载数据并执行所有示例代码，耗时较长；之后的
构建会复用缓存，速度快很多。

## 文档维护

本文档尚有很多不完善之处，欢迎读者参与到文档的维护与更新中。详情见
[贡献指南](https://seismo-learn.org/contributing/)。

## 许可协议

本作品采用 [知识共享署名-非商业性使用 4.0 国际许可协议 (CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/deed.zh-hans) 。
任何人都可以自由地分享、修改本作品，但必须遵循如下条件：

- 署名：必须提到原作者，提供指向此许可协议的链接，表明是否有做修改
- 非商业性使用：不能对本作品进行任何形式的商业性使用
