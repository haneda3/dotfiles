scriptencoding utf-8

set encoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set nocompatible

if has('vim_starting')
	  filetype plugin off
	    filetype indent off
	      execute 'set runtimepath+=' . expand('~/.vim/bundle/neobundle.vim')
	        call neobundle#rc(expand('~/.vim/bundle'))
	endif

  NeoBundle 'http://github.com/kien/ctrlp.vim.git'
	NeoBundle 'http://github.com/Shougo/neobundle.vim.git'
	NeoBundle 'http://github.com/scrooloose/nerdtree.git'
	NeoBundle 'http://github.com/scrooloose/syntastic.git'

	syntax on
	filetype plugin on
	filetype indent on

  " urabuffer
  nnoremap <C-j> <C-^>

  " visual beep
  set visualbell

	" SSH クライアントの設定によってはマウスが使える（putty だと最初からい
	" ける）
	"set mouse=n

