#!/bin/bash

# ファイル名を引数にとり、シンボリックを張る関数
# sample) symblic_link .vimrc

# dotfilesフォルダ内にあるか
#  |    |
#  |    シンボリックは貼られているか - OK
#  |    |
#  |    シンボリックを貼って、完了
#  |
#  ~/ フォルダ内にあるか - dotfilesに移動させてシンボリックを張る
#  |
#  エラー(dotfiles、~/ の両方にファイルが存在しない場合エラー)

symblic_link () {
    # dotfilesフォルダ内にある場合、シンボリックを張る
    if [ -e ~/dotfiles/$1 ]; then
        # 既にシンボリックが貼られている場合、OKを返す
        if [ -e ~/$1@ ]; then
            echo "OK: $1"
        # シンボリックが貼られていなかった場合、貼った後にOKを返す
        else
            ln -sf ~/dotfiles/$1 ~/$1
            echo "OK: $1 symbliced"
        fi
    # dotfilesフォルダ内になかった場合、
    # ルートディレクトリ上にファイルがあるかを確認する
    else
        # ルートディレクトリ上にファイルがあった場合、
        # dotfilesに移動させた上で、シンボリックを張る
        if [ -e ~/$1 ]; then
            mv ~/$1 ~/dotfiles/
            ln -sf ~/dotfiles/$1 ~/$1
            echo "MV: $1 symbliced"
        # dotfilesにもルートディレクトリ上にもなかった場合、
        # エラーが起こっていることが想定されるため
        # NO を返す
        else
            echo "NO: $1 is nothing"
        fi
    fi
}

symblic_link .vimrc
symblic_link .tigrc

