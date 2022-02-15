# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))
from datetime import datetime


# -- Project information -----------------------------------------------------

project = "地震“学”科研入门教程"
author = "seismo-learn"
copyright = f"2020–{datetime.today().year}, {author}"
github_user = "seismo-learn"
github_repo = "seismology101"
github_url = f"https://github.com/{github_user}/{github_repo}"


# -- Contributor information -------------------------------------------------

rst_prolog = """
.. |田冬冬| replace:: `田冬冬 <https://me.seisman.info/>`__
.. |姚家园| replace:: `姚家园 <https://github.com/core-man>`__
.. |王亮| replace:: `王亮 <https://github.com/wangliang1989>`__
.. |赵志远| replace:: `赵志远 <https://github.com/zhaozhiyuan1989>`__
"""


# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    "sphinx.ext.githubpages",
    "sphinx.ext.intersphinx",
    "sphinx_cjkspace.cjkspace",
    "sphinx_copybutton",
    "sphinx_design",
    "myst_nb",
]

# Add any paths that contain templates here, relative to this directory.
templates_path = ["_templates"]

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = "zh_CN"

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = []

# Cross-refering other projects
# https://www.sphinx-doc.org/en/master/usage/extensions/intersphinx.html
intersphinx_mapping = {
    "seis": ("https://seismo-learn.org/seismology/", None),
    "seis101": ("https://seismo-learn.org/seismology101/", None),
    "software": ("https://seismo-learn.org/software/", None),
}

# options for sphinx-copybutton
# https://sphinx-copybutton.readthedocs.io
copybutton_prompt_text = r">>> |\.\.\. |\$ |In \[\d*\]: | {2,5}\.\.\.: | {5,8}: "
copybutton_prompt_is_regexp = True
copybutton_only_copy_prompt_lines = True
copybutton_remove_prompts = True

# options for myst-nb
jupyter_execute_notebooks = "cache"

# -- Options for HTML output -------------------------------------------------
html_theme = "sphinx_book_theme"
html_static_path = ["_static"]
html_extra_path = []
html_last_updated_fmt = "%Y 年 %m 月 %d 日"
html_title = project
html_css_files = ["custom.css"]

html_theme_options = {
    "repository_url": f"{github_url}",
    "use_edit_page_button": True,
    "use_issues_button": True,
    "use_repository_button": True,
}

html_context = {
    "favicon": "favicon.ico",
    "display_github": True,
    "github_user": github_user,
    "github_repo": github_repo,
    "github_version": "main",
    "conf_py_path": "/source/",
    "theme_vcs_pageview_mode": "blob",
    "menu_links": [
        (   '<i class="fa fa-home"></i> 地震“学”主站',
            "https://seismo-learn.org/",
        ),
        (
            '<i class="fa fa-github fa-fw"></i> 网站源码',
            github_url,
        ),
        (
            '<i class="fa fa-edit fa-fw"></i> 贡献指南',
            "https://seismo-learn.org/contributing/",
        ),
        (
            '<i class="fa fa-comments fa-fw"></i> 参与讨论',
            f"{github_url}/discussions",
        ),
    ],
}
