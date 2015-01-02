set nocompatible
set wrap linebreak textwidth=0 
map j gj
map k gk
map [Up] gk
map [Down] gj
set hlsearch
set incsearch
set spelllang=en_us
colorscheme monokai
set background=dark
set number
set mouse=i
"Set cursor type based on mode
"if has("autocmd")
"  au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"  au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"  au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"end

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

set showmode
set ruler                         " Show cursor position.
set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.
set ruler
set title                         " Set the terminal's title

set visualbell                    " No beeping.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location
" set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{fugitive#statusline()}%{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P
set tabstop=2 " size of hard tabstop
set softtabstop=2
set expandtab " tabs are spaces
set shiftwidth=2 "number of spaces for indentation
set autoindent "maintain indention of previous line
"pathogen!
execute pathogen#infect()
syntax on
"set cursorline
"map <leader>s 1z=

" :%s/foo/bar/gc
" in insert mode ctrl-l will autocorrect the most recently misspelled word
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
"neocomplete
let g:neocomplcache_enable_at_startup = 1
" ctr-r: Find and replace visually selected text in document with new phrase of your choosing
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>
"map F2 to Nerdtreetoggle
silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F5>"
