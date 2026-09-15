#!/bin/sh
# src/app.html（アーティファクト用の断片）を、GitHub Pages に置ける単体HTMLに包む。
# 包みの中身は Artifact 側のスケルトンと同じにしてあり、両者で同じ見えになる。
set -e
{
  printf '%s\n' '<!doctype html>' '<html lang="ja">' '<head>' \
  '<meta charset="utf-8">' \
  '<meta name="viewport" content="width=device-width,initial-scale=1,viewport-fit=cover">' \
  '<style>' \
  ':root{color-scheme:light;padding-top:env(safe-area-inset-top,0px);padding-bottom:env(safe-area-inset-bottom,0px)}' \
  'body{margin:0;font:14px system-ui,sans-serif;background:#fafaf9}' \
  'img{max-width:100%}[hidden]{display:none!important}' \
  '</style>' '</head>' '<body>'
  cat src/app.html
  printf '%s\n' '</body>' '</html>'
} > index.html
echo "index.html を生成しました ($(wc -c < index.html) バイト)"
