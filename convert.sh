#!/bin/bash

set -e

echo "c2md — Export Confluence pages to Markdown"

read -p "Confluence org name (e.g. acme): " ORG
read -p "Page ID: " PAGE_ID
read -p "Confluence username (email): " USERNAME
read -s -p "API token (input hidden): " API_TOKEN
echo ""

BASE_URL="https://${ORG}.atlassian.net/wiki"

# Dependencies check
for cmd in jq pandoc; do
  if ! command -v $cmd &> /dev/null; then
    echo "❌ Missing required tool: $cmd"
    exit 1
  fi
done

echo "Fetching page content..."
RESPONSE=$(curl -s -u "$USERNAME:$API_TOKEN" \
  "$BASE_URL/rest/api/content/$PAGE_ID?expand=body.storage")

HTML=$(echo "$RESPONSE" | jq -r '.body.storage.value')

if [[ "$HTML" == "null" ]]; then
  echo "❌ Failed to fetch or parse page. Check your credentials and page ID."
  exit 1
fi

echo "$HTML" > input.html

echo "Converting to Markdown..."
pandoc -f html -t markdown -o page.md input.html

echo "✅ Done. Markdown saved to: page.md"
