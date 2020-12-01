# dotfiles

## 必須要件

- Nodeインストール（coc.nvimのため）
- Powerlinefontのインストール（vim_airline,tig_airlineのため）
  - フォントの種類
  - Meslo LG S DZ Regular for Powerline 11pt

## 使い方

- サーバーにgitをインストール
- ホームディレクトリで`git clone https://github.com/yCroma/dotfiles.git`
- `bash symbolic_link.sh`

## deinで使うコマンド

- cache clear
    - `:call dein#recache_runtimepath()`
- plugin install
    - `:call dein#install()`
