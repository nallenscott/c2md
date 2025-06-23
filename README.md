# c2md

**c2md** is a one-liner CLI tool for exporting Confluence pages to Markdown.

It fetches the raw XHTML using the Atlassian API and converts it to clean, portable Markdown using `pandoc`.

No cloning, no browser, no nonsense.

---

## 🚀 Quick Start

```bash
bash <(curl -s https://raw.githubusercontent.com/nallenscott/c2md/main/convert.sh)
```

You'll be prompted for:
- Confluence **org name** (e.g. `acme`)
- Page ID
- Confluence email (username)
- API token (input is hidden)

---

## 🛠 Requirements

- [`pandoc`](https://pandoc.org/installing.html)
- [`jq`](https://stedolan.github.io/jq/)

Install via Homebrew:

```bash
brew install pandoc jq
```

---

## 📦 What It Does

- Hits the Confluence API
- Extracts the raw XHTML from `body.storage.value`
- Cleans it up
- Converts to Markdown using `pandoc`
- Saves output to `page.md`

---

## 🧪 Example

```bash
Confluence org:     acme
Page ID:            1234567890
Output:             ./page.md
```

---

## 🙋‍♂️ Why

- Atlassian doesn’t support Markdown export natively
- This makes it dead simple to extract content without dealing with a browser

---

## ⚠️ Heads up

- Macros like Jira links, attachments, and embedded diagrams will show up as raw `<ac:*>` tags
- Attachments aren’t downloaded
- Some cleanup might still be needed for edge cases like nested formatting

For most text-heavy pages, it just works.

---

## 📝 License

MIT
