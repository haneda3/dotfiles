scriptencoding utf-8

set encoding=utf-8
set fileencodings=utf-8,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932

set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

set nocompatible

imap jjjj <ESC>
nnoremap <C-a> <HOME>
nnoremap <C-e> <END>

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
NeoBundle 'http://github.com/Shougo/neocomplcache.vim.git'
NeoBundle 'http://github.com/altercation/vim-colors-solarized.git'
NeoBundle 'http://github.com/Shougo/unite.vim.git'

syntax on
filetype plugin on
filetype indent on

" color scheme
syntax enable
set background=dark
set t_Co=256
let g:solarized_termcolors=256
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_underline=1
let g:solarized_italic=1
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

" status line
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set laststatus=2

" perl highlight
augroup filetypedetect
  autocmd! BufNewFile,BufRead *.t setf perl
  autocmd! BufNewFile,BufRead *.psgi setf perl
  autocmd! BufNewFile,BufRead *.tt setf tt2html
augroup END

" indent for filetype
augroup vimrc
  autocmd! FileType perl setlocal shiftwidth=4 tabstop=2 softtabstop=2
augroup END

" highlight trailing space
augroup HighlightTrailingSpaces
  autocmd!
  autocmd VimEnter,WinEnter,ColorScheme * highlight TrailingSpaces term=underline guibg=Red ctermbg=Red
  autocmd VimEnter,WinEnter * match TrailingSpaces /\s\+$/
augroup END

" visual mode ,ptv as perltidy
map ,ptv <Esc>:'<,'>! perltidy<CR>

" show line number
set number

" urabuffer
nnoremap <C-j> <C-^>

" visual beep
set visualbell

" mouse support
set mouse+=a
if &term =~ '^screen'
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
endif

"
let g:neocomplcache_enable_at_startup = 1

" boot NERDTree
let file_name = expand("%:p")
if has('vim_starting') &&  file_name == ""
    autocmd VimEnter * call ExecuteNERDTree()
endif

" カーソルが外れているときは自動的にnerdtreeを隠す
function! ExecuteNERDTree()
  "b:nerdstatus = 1 : NERDTree 表示中
  "b:nerdstatus = 2 : NERDTree 非表示中

  if !exists('g:nerdstatus')
    execute 'NERDTree ./'
    let g:windowWidth = winwidth(winnr())
    let g:nerdtreebuf = bufnr('')
    let g:nerdstatus = 1

  elseif g:nerdstatus == 1
    execute 'wincmd t'
    execute 'vertical resize' 0
    execute 'wincmd p'
    let g:nerdstatus = 2
  elseif g:nerdstatus == 2
    execute 'wincmd t'
    execute 'vertical resize' g:windowWidth
    let g:nerdstatus = 1

  endif
endfunction

" NERDTree toggle on/off
nnoremap <F3> :<C-u>:call ExecuteNERDTree()<cr>

" バッファ一覧
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> <F4> :<C-u>Unite buffer<CR>

