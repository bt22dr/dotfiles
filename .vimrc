set nu
set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

set hlsearch " 검색어 하이라이팅
set showmatch " 일치하는 괄호 하이라이팅
" set smartcase " 검색시 대소문자 구별

" Indendations
set cindent
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Syntax Highlighting
"if has(“syntax”)
syntax on
"endif

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" Plug
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'ctrlpvim/ctrlp.vim'       "Ctrl + P for search file
Plug 'vim-syntastic/syntastic'
call plug#end()


" golang
set autowrite
nnoremap <leader>cn :cnext<CR>
nnoremap <leader>cp :cprevious<CR>
nnoremap <leader>ca :cclose<CR>
autocmd FileType go nmap <leader>b  <Plug>(go-build)
autocmd FileType go nmap <leader>r  <Plug>(go-run)

" syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['python']
let g:syntastic_go_checkers = ['go'] " ['govet', 'errcheck', 'go']
let g:go_list_type = "quickfix"
let g:syntastic_warning_symbol = "✗"
let g:syntastic_error_symbol = "X"

"map <C-n> :lnext<CR>
"map <C-m> :lprevious<CR>
nnoremap <leader>ln :lnext<CR>
nnoremap <leader>lp :lprevious<CR>

" NerdTree
nmap <C-F11> :NERDTreeToggle<CR>

" Tagbar
nmap <C-F12> :TagbarToggle<CR>
