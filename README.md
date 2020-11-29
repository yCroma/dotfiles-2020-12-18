# dotfiles

## 使い方

- サーバーにgitをインストール
- ホームディレクトリで`git clone https://github.com/yCroma/dotfiles.git`
- `bash symbolic_link.sh`

## deinで使うコマンド

- cache clear
    - `:call dein#recache_runtimepath()`
- plugin install
    - `:call dein#install()`
