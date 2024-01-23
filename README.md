# init.vimに関する説明
まず、このrepositoryは'~/.config'配下にcloneします.

## BASE SETTING
1. belloff

## PLUGIN MANAGER SETTING
### FIRST SETTING
1. plugin manager のコードを置くためのディレクトリを作成します.
```
mkdir ~/.local/share/nvim
cd ~/.local/share/nvim
mkdir site/autoload
```
'autoload'ディレクトリ配下にplug.vimファイルを置きます.

2. init.vimにそれ以下のことは書いてあるのであとは大丈夫です.

### PLUGIN INPUT
1. neovimを起動して':PlugInstall'をするとダウンロードできます.

### PLUGIN MANAGER COMMANDS

### NERD TREE COMMANDS
#### ファイルに関するコマンド
`o`  : ファイルを開く
`t`  : 別タブで開く
`T`  : 別タブ・バックグラウンドで開く
`i`  : 画面分割して開く(上下)
`gi` : 画面分割して開く(上下)カーソルはtreeのまま
`s`  : 画面分割して開く(左右)
`si` : 画面分割して開く(左右)カーソルはtreeのまま
