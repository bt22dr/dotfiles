set nu
set autoindent
set cindent
set hlsearch " 검색어 하이라이팅
set showmatch " 일치하는 괄호 하이라이팅
" set smartcase " 검색시 대소문자 구별
set laststatus=2 " 상태바 표시를 항상한다
set statusline=\ %<%l:%v\ [%P]%=%a\ %h%m%r\ %F\

" Indendations
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4

" Syntax Highlighting
"if has(“syntax”)
syntax on
"endif

" 마지막으로 수정된 곳에 커서를 위치함
au BufReadPost *
\ if line("'\"") > 0 && line("'\"") <= line("$") |
\ exe "norm g`\"" |
\ endif



