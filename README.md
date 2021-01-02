# 地震“学”入门教程

![build](https://github.com/seismo-learn/seismology101/workflows/Build%20Website/badge.svg)
[![License: CC BY-NC 4.0](https://img.shields.io/badge/License-CC%20BY--NC%204.0-blue.svg)](https://creativecommons.org/licenses/by-nc/4.0/deed.zh)


本文档主要介绍地震学基础，以便初学者快速入门等。

- 项目主页：https://github.com/seismo-learn/seismology101
- 网页版：https://seismo-learn.org/seismology101/

## 构建文档

本文档使用 [Sphinx](http://www.sphinx-doc.org/) 构建得到。Sphinx 是基于 Python 的
文档生成工具。

1.  下载文档源码

        git clone --depth=50 https://github.com/seismo-learn/seismology101.git

2.  安装文档所需依赖

        cd seismology101/
        pip install -r requirements.txt

3.  编译生成HTML格式的文档。生成的文档位于 `build/html/` 目录下

        make html

## 文档维护

本文档尚有很多不完善之处，欢迎使用这些软件的用户参与到教程的维护与更新中。
详情见 [维护指南](CONTRIBUTING.md)。

## 许可协议

本作品采用 [知识共享署名-非商业性使用 4.0 国际许可协议 (CC BY-NC 4.0)](https://creativecommons.org/licenses/by-nc/4.0/deed.zh) 。
任何人都可以自由地分享、修改本作品，但必须遵循如下条件：

- 署名：必须提到原作者，提供指向此许可协议的链接，表明是否有做修改
- 非商业性使用：不能对本作品进行任何形式的商业性使用
