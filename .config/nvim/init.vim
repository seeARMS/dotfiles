set clipboard=unnamed

call plug#begin()

Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
"Plug 'shyiko/vim-smooth-scroll'
Plug 'yuttie/comfortable-motion.vim'
Plug 'alvan/vim-closetag'
Plug 'Raimondi/delimitMate'
Plug 'airblade/vim-gitgutter'
Plug 'skammer/vim-css-color'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'neomake/neomake'
Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'
Plug 'sheerun/vim-polyglot'
Plug 'yonchu/accelerated-smooth-scroll'

call plug#end()

" Plugin 'altercation/vim-colors-solarized'  " New line!!

" Some settings to enable the theme:
set number        " Show line numbers
syntax enable     " Use syntax highlighting
"syntax on
colorscheme onedark
:set directory=$HOME/.vim/swapfiles//
"set background=dark
"colorscheme solarized
nnoremap d "_d
vnoremap d "_d

set mouse=

"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>


let g:javascript_plugin_jsdoc = 1

let delimitMate_expand_space = 1
let delimitMate_balance_matchpairs = 1
let delimitMate_expand_cr = 1

"noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 30, 2)<CR>
"noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 30, 2)<CR>
"noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 30, 4)<CR>
"noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 30, 4)<CR>

"let g:indentLine_leadingSpaceChar = '·'
"let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_char = '·'
let g:indentLine_showFirstIndentLevel = 0
""let g:indentLine_color_term = 110
let g:indentLine_color_gui = '#717171'
let g:indentLine_faster = 1
set laststatus=2


function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.handlebars"

autocmd! User FzfStatusLine call <SID>fzf_statusline()

autocmd bufwritepost *.js silent !standard --fix % > /dev/null
set autoread

set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.

let g:deoplete#enable_at_startup = 1



set backspace=indent,eol,start
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set incsearch
"#set hlsearch
set cindent

let g:airline_theme='onedark'
let g:airline_powerline_fonts = 1

let g:neomake_verbose=3
let g:neomake_javascript_enabled_makers = ['standard']
let g:neomake_jsx_enabled_makers = ['standard']

autocmd! BufWritePost * Neomake

if (has("termguicolors"))
  set termguicolors
endif

fun! <SID>StripTrailingWhitespaces()
      let l = line(".")
      let c = col(".")
      %s/\s\+$//e
      call cursor(l, c)
endfun

autocmd FileType c,cpp,java,js,php,ruby,python autocmd BufWritePre <buffer> :call <SID>StripTrailingWhitespaces()

