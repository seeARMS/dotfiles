noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

nmap <silent> <leader>aj :ALENext<cr>
nmap <silent> <leader>ak :ALEPrevious<cr>


" Map d and c to the black hole register: https://stackoverflow.com/questions/11993851/how-to-delete-not-cut-in-vim
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
nnoremap c "_c
vnoremap c "_c
nnoremap C "_C
vnoremap C "_C

nnoremap x "_x
nnoremap x "_x
vnoremap X "_X
vnoremap X "_X


" Automatically trigger fzf on Control P
nnoremap <C-P>       :Files<CR>

function ALELSPMappings()
	let l:lsp_found=0
	for l:linter in ale#linter#Get(&filetype) | if !empty(l:linter.lsp) | let l:lsp_found=1 | endif | endfor
	if (l:lsp_found)
		nnoremap <buffer> <C-]> :ALEGoToDefinition<CR>
		nnoremap <buffer> <C-^> :ALEFindReferences<CR>
	else
		silent! unmap <buffer> <C-]>
		silent! unmap <buffer> <C-^>
	endif
endfunction
autocmd BufRead,FileType * call ALELSPMappings()


"let g:ale_disable_lsp = 1
"let g:ale_completion_enabled = 1

set clipboard=unnamed

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

"set rtp+=/usr/local/opt/fzf

call plug#begin('~/.config/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}



Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-surround'
Plug 'sickill/vim-pasta'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'dense-analysis/ale'
Plug 'leafoftree/vim-vue-plugin'
Plug 'andymass/vim-matchup'
Plug 'github/copilot.vim'
Plug 'thesis/vim-solidity'

Plug 'HerringtonDarkholme/yats.vim'

" Shows icons, when using a patched nerdfont, in various Vim plugins like
" Ctrl+P
Plug 'ryanoasis/vim-devicons'

Plug 'majutsushi/tagbar'
Plug 'preservim/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ap/vim-css-color'

Plug 'Yggdroot/indentLine'
Plug 'vim-airline/vim-airline'

" TypeScript syntax highlighting
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'


" Handlebars syntax highlighting
Plug 'mustache/vim-mustache-handlebars'


Plug 'tpope/vim-obsession'
Plug 'dhruvasagar/vim-prosession'

Plug 'rodrigore/coc-tailwind-intellisense', {'do': 'npm install'}

" Deprecated plugins
" fzf is better than ctrlP/
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'neomake/neomake'
"Plug 'yuttie/comfortable-motion.vim'
"Plug 'alvan/vim-closetag'
"Plug 'Raimondi/delimitMate'

" Color theme
" Plug 'jacoborus/tender.vim'
Plug 'joshdick/onedark.vim'
"Plug 'rakr/vim-one'



" The below is for CodeGPT
Plug 'nvim-lua/plenary.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'dpayne/CodeGPT.nvim'
" The above is for CodeGPT




"Plug 'sheerun/vim-polyglot'

call plug#end()
set foldmethod=indent " Allow folding with zc, zf and zo
set foldlevelstart=99


" Needed by yats.vim
set re=0

" Required for coc.nvim for some reason
if exists("+pyxversion")
    set pyxversion=3
endif
let b:coc_root_patterns = ['.git', '.env', 'package.json']




let g:vim_vue_plugin_use_typescript = 1

" For rakr/vim-one theme

set number        " Show line numbers
syntax enable     " Use syntax highlighting
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set backspace=indent,eol,start
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set incsearch
"#set hlsearch
set cindent

" https://stackoverflow.com/questions/40601818/vim-displays-json-file-without-any-quotes
let g:vim_json_conceal=0

"
" Disable IndentLines in JSON files, otherwise
" quotation marks will be hidden.
autocmd Filetype json :IndentLinesDisable

" Do the same for markdown, or else underscores will be hidden
autocmd Filetype markdown :IndentLinesDisable



set encoding=UTF-8


if (has("termguicolors"))
 set termguicolors
endif

let g:airline_powerline_fonts = 1

let g:airline#extensions#branch#format = 1
let g:airline#extensions#default#section_truncate_width = {
    \ 'b': 5,
    \ 'x': 5,
    \ 'y': 5,
    \ 'z': 5,
    \ 'warning': 80,
    \ 'error': 80,
    \ }

let g:airline_section_y = ''
let g:airline_section_x = ''

syntax on

colorscheme onedark
let g:onedark_terminal_italics = 1
let g:airline_theme = 'onedark'


"colorscheme one
"set background=dark " for the dark version
"let g:airline_theme = 'one'


" Vue syntax highlighting
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_scss = 1


" See: https://github.com/kien/ctrlp.vim/issues/174
" let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']




" This auto-indents to the correct level in filetypes.
filetype on
filetype plugin on


" Helpful autocomplete for handlebars files
let g:mustache_abbreviations = 1

" Auto fix using ALE.
" Note need to add the prettier-solidity-plugin
" for it to work.
let g:ale_fix_on_save = 1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['prettier', 'eslint'],
\   'vue': ['prettier', 'eslint'],
\   'solidity': ['prettier', 'eslint'],
\   'scss': ['prettier', 'stylelint'],
\   'css': ['prettier', 'stylelint'],
\   'typescript': ['prettier', 'eslint'],
\   'typescriptreact': ['prettier', 'eslint'],
\   'python': ['black', 'isort'],
\   'json': [ 'fixjson'],
\}

" TODO: This allows all paths. We should only allow Paragraph paths.
let g:ale_solidity_solc_options = '--allow-paths'


"\   'html': ['tidy', 'prettier'],
"\   'handlebars': ['prettier' ],
"
augroup SyntaxSettings
    autocmd!
    autocmd BufNewFile,BufRead *.ts set syntax=javascript
    autocmd BufNewFile,BufRead *.tsx set syntax=javascriptreact
augroup END
