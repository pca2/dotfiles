set nocompatible
set wrap linebreak textwidth=0
map j gj
map k gk
map [Up] gk
map [Down] gj
set background=dark
set hlsearch
set incsearch
set spelllang=en_us
let g:solarized_termcolors = 256  
colorscheme monokai
set number
set mouse=i
highlight Search ctermfg=black ctermbg=yellow
hi SpellBad cterm=underline ctermfg=white ctermbg=darkred
syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

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
set tabstop=2 " size of hard tabstop
set softtabstop=2
set expandtab " tabs are spaces
set shiftwidth=2 "number of spaces for indentation
set autoindent "maintain indention of previous line
syntax on
" in insert mode ctrl-l will autocorrect the most recently misspelled word
imap <c-l> <c-g>u<Esc>[s1z=`]a<c-g>u
" ctr-r: Find and replace visually selected text in document with new phrase of your choosing
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left><left>
"map F2 to Nerdtreetoggle
"silent! nmap <C-p> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
map <F2> :NERDTreeToggle<CR>
map <F6> :SyntasticToggleMode <CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F5>"
let g:NERDTreeNodeDelimiter = "\u00a0"

" airline statusbar and buffer manager
" Enable the list of buffers
 let g:airline#extensions#tabline#enabled = 1
"
" " Show just the filename
" let g:airline#extensions#tabline#fnamemod = ':t'"
" buffer list formatting
 let g:airline#extensions#tabline#left_sep = '||'
 let g:airline#extensions#tabline#left_alt_sep = ' ∥ '
"disable whitespace detection
 let g:airline#extensions#whitespace#enabled = 0
" configure whether buffer numbers should be shown. >
 let g:airline#extensions#tabline#buffer_nr_show = 1

"airline will show mode
set noshowmode
set laststatus=2
"ctrl-s = and ctrl-s - will insert some erb tags
let b:surround_{char2nr('=')} = "<%= \r %>"
let b:surround_{char2nr('-')} = "<% \r %>"

"buffer switching
silent! map <F8> :bp<CR>
silent! map <F9> :bn<CR>
"search highlighted text
vnoremap // y/<C-R>"<CR>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"

"different clipboard copying based on OS
let uname = system("echo -n \"$(uname)\"")
if uname == "Darwin"
  vnoremap <C-c> "+y<CR>
endif
if uname == "Linux"
  vnoremap <C-c> "+y<CR>
endif
if uname =~ "CYGWIN"
  vnoremap <C-c> "*y<CR>
endif

set nofoldenable
"non-regex search with :SS
command! -nargs=1 SS let @/ = '\V'.escape(<q-args>, '/\')|normal! /<C-R>/<CR>

"search open doc and return only matching lines in new window
command! -nargs=1 Vgrep vimgrep <q-args> % | copen"')

"vim-plug
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'maralla/completor.vim'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'elixir-lang/vim-elixir'
Plug 'jiangmiao/auto-pairs'
Plug 'kchmck/vim-coffee-script'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'scrooloose/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'tomtom/tlib_vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-ruby/vim-ruby'
Plug 'plasticboy/vim-markdown'
Plug 'davidoc/taskpaper.vim'
Plug '/usr/local/opt/fzf' 
"If installed via git, you will need to create symlink from here to ~/.fzf/
Plug 'junegunn/fzf.vim'


" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"highlighting seems to get overwritten
highlight Search ctermfg=black ctermbg=yellow

let g:vim_markdown_folding_disabled = 1

"Search files in pwd using fzf and ripgrep https://bit.ly/2qeNqPc
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"search just my notes folder
command! -bang -nargs=* Notes call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, {'dir': '~/Dropbox/epistle'},  <bang>0)

"ctrlp replacement
map <C-p> :Files<CR>


let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'
