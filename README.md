# c2md

**c2md** is a one-liner CLI tool for exporting Confluence pages to Markdown.

It fetches the raw XHTML using the Atlassian REST API and converts it to clean, portable Markdown using `pandoc`.

No cloning, no browser, no nonsense.

---

## 🚀 Quick Start

```bash
bash <(curl -s https://raw.githubusercontent.com/nallenscott/c2md/main/convert.sh)
