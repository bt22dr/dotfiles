""""""""""""""""""""""
"      Settings      "
""""""""""""""""""""""
set nocompatible                " Enables us Vim specific features
filetype off                    " Reset filetype detection first ...
filetype plugin indent on       " ... and enable filetype detection
set ttyfast                     " Indicate fast terminal conn for faster redraw
set encoding=utf-8              " Set default encoding to UTF-8
set autoread                    " Automatically read changed files
set autoindent                  " Enabile Autoindent
set backspace=indent,eol,start  " Makes backspace key more powerful.
set incsearch                   " Shows the match while typing
set hlsearch                    " Highlight found searches
set noerrorbells                " No beeps
set number                      " Show line numbers
set showcmd                     " Show me what I'm typing
set noswapfile                  " Don't use swapfile
set nobackup                    " Don't create annoying backup files
set splitright                  " Vertical windows should be split to right
set splitbelow                  " Horizontal windows should split to bottom
set autowrite                   " Automatically save before :next, :make etc.
set showmatch                   " 일치하는 괄호 하이라이팅
"set noshowmode                  " We show the mode with airline or lightline
set ignorecase                  " Search case insensitive...
set smartcase                   " ... but not it begins with upper case
set laststatus=2                " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" Colorscheme
syntax enable
set t_Co=256
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

" for python
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif

""""""""""""""""""""""
"      Mappings      "
""""""""""""""""""""""

" Set leader shortcut to a comma ','. By default it's the backslash
let mapleader = ","

" Visual linewise up and down by default (and use gj gk to go quicker)
noremap <Up> gk
noremap <Down> gj
"noremap j gj
"noremap k gk

" vim-go
"--------
" Jump to next error with Ctrl-n and previous error with Ctrl-m. Close the
" quickfix window with <leader>a
"map <C-n> :cnext<CR>
"map <C-m> :cprevious<CR>
"nnoremap <leader>a :cclose<CR>

" NerdTree
"----------
nmap <F7> :NERDTreeToggle<CR>

" Tagbar
"--------
nmap <F8> :TagbarToggle<CR>

" Syntastic
"-----------
map <C-n> :lnext<CR>
map <C-m> :lprevious<CR>

"""""""""""""""""""""
"      Plugins      "
"""""""""""""""""""""

" Plug
call plug#begin()
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
Plug 'ctrlpvim/ctrlp.vim'       "Ctrl + P for search file
Plug 'vim-syntastic/syntastic'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
call plug#end()
"autocmd VimEnter * NERDTree    # vim 시작할 때 NERDTree 실행

" nerdtree {
    let g:NERDTreeShowBookmarks = 1
    let g:NERDTreeShowHidden = 1
" }

" syntastic {
    set statusline+=%#warningmsg#
    set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 1
    let g:syntastic_check_on_wq = 0
    let g:syntastic_python_checkers = ['pylint']
    let g:syntastic_go_checkers = ['go'] " ['govet', 'errcheck', 'go']
    let g:syntastic_warning_symbol = ">"
    let g:syntastic_error_symbol = "✗"
" }

" vim-go {
    let g:go_fmt_command = "goimports"
    let g:go_autodetect_gopath = 1
    let g:go_list_type = "quickfix"

    let g:go_highlight_types = 1
    let g:go_highlight_fields = 1
    let g:go_highlight_functions = 1
    let g:go_highlight_function_calls = 1
    let g:go_highlight_extra_types = 1
    let g:go_highlight_generate_tags = 1

    augroup go
      autocmd!

      " Show by default 4 spaces for a tab
      autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

      " :GoBuild and :GoTestCompile
      autocmd FileType go nmap <leader>b  <Plug>(go-build)
      "autocmd FileType go nmap <leader>b :<C-u>call <SID>build_go_files()<CR>

      " :GoTest
      autocmd FileType go nmap <leader>t  <Plug>(go-test)

      " :GoRun
      autocmd FileType go nmap <leader>r  <Plug>(go-run)

      " :GoDoc
      autocmd FileType go nmap <Leader>d <Plug>(go-doc)

      " :GoCoverageToggle
      autocmd FileType go nmap <Leader>c <Plug>(go-coverage-toggle)

      " :GoInfo
      autocmd FileType go nmap <Leader>i <Plug>(go-info)

      " :GoMetaLinter
      autocmd FileType go nmap <Leader>l <Plug>(go-metalinter)

      " :GoDef but opens in a vertical split
      autocmd FileType go nmap <Leader>v <Plug>(go-def-vertical)

      " :GoDef but opens in a horizontal split
      autocmd FileType go nmap <Leader>s <Plug>(go-def-split)

      "autocmd FileType go nmap <leader>gc <Plug>(go-callees)
      "autocmd FileType go nmap <leader>gi <Plug>(go-implements)

      " :GoAlternate  commands :A, :AV, :AS and :AT
      autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit')
      autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
      autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
      autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')
    augroup END
" }
