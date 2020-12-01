# dotfiles

## 必須要件

- Nodeインストール（coc.nvimのため）
- Powerlinefontのインストール（vim_airline,tig_airlineのため）
  - フォントの種類
    - Meslo LG S DZ Regular for Powerline 11pt
  - インストール方法
    - Ubuntu
      - `sudo apt-get install fonts-powerline`
    - CentOS（dnfが使えるもの）
      - `sudo dnf install powerline-fonts`
    - それら以外
      - git参照(https://github.com/powerline/fonts)

## 使い方

- サーバーにgitをインストール
- ホームディレクトリで`git clone https://github.com/yCroma/dotfiles.git`
- `bash symbolic_link.sh`

## deinで使うコマンド

- cache clear
    - `:call dein#recache_runtimepath()`
- plugin install
    - `:call dein#install()`
