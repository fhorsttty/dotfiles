set modeline            " モードライン機能を有効にする。
set number              " 行数を表示する。
set wrap                " 行内の文字が画面からはみ出す際は折り返して表示する。
set ruler               " カーソルの位置情報を表示する。
set expandtab           " タブ入力を空白文字に置換する。
set tabstop=2           " タブの幅を２文字にする。
set softtabstop=2       " タブキー押下時の移動幅
set shiftwidth=2        " 挿入する字下げ幅を２文字にする。
set autoindent          " 改行時に字下げ幅を自動的に挿入する。
set smartindent         " C言語風の字下げをする。
set noequalalways       " ウィンドウ分割時に高さを等分に分割しない。
set visualbell t_vb=    " ビープ音をビジュアルベルに変更し、機能を無効にする。
set noerrorbells        " エラーを表示するとにビープ音を鳴らさない。 
set t_Co=256            " トゥルーカラーを使用する。確認 => :verbose set t_Co?
set t_ut=               " 文字の背景色と画面の背景色が一致しない場合の黒魔術(非推奨)

set ignorecase          " 文字列検索時に大文字小文字の区別を無視する。 
set smartcase           " 大文字小文字が混在する場合は、区別して検索する。 
set incsearch           " インクリメンタルサーチ
set wrapscan            " 検索結果がファイル末尾に達したら先頭にジャンプする。 
set hlsearch            " 検索文字列にマッチしたものを強調表示する。

set directory=~/.vim/tmp  " .swap
set backupdir=~/.vim/tmp  " .bak
set undodir=~/.vim/tmp    " .un
set viminfo+=n$HOME/.vim/viminfo

" filetype plugin indent on     " ファイルの拡張子に応じて字下げする。
" set syntax on                 " 構文に応じて文字を色付けする。
colorscheme molokai
