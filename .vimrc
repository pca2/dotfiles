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
set directory=$HOME/.vim/swap//,/tmp//,.  " Keep swap files in one location
set backupdir=$HOME/.vim/backup//,/tmp//,.
set undodir=/tmp,.
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
map <F6> :ALEToggle <CR>

let g:NERDTreeMapActivateNode="<F3>"
let g:NERDTreeMapPreview="<F5>"
let g:NERDTreeNodeDelimiter = "\u00a0"
let g:NERDTreeWinSize=25

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
Plug 'ajh17/VimCompletesMe'
Plug 'airblade/vim-gitgutter'
Plug 'bling/vim-airline'
Plug 'jiangmiao/auto-pairs'
Plug 'chemzqm/vim-jsx-improve'
Plug 'alvan/vim-closetag'
Plug 'scrooloose/nerdtree'
Plug 'dense-analysis/ale'
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
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install()  }  }
Plug 'tpope/vim-surround'
Plug 'christoomey/vim-tmux-navigator'
Plug 'lifepillar/vim-solarized8'
Plug 'RRethy/vim-illuminate'
Plug 'Chiel92/vim-autoformat'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"highlighting seems to get overwritten
highlight Search ctermfg=black ctermbg=yellow

let g:vim_markdown_folding_disabled = 1

"Search files in pwd using fzf and ripgrep https://bit.ly/2qeNqPc
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case  --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
command! -bang -nargs=* F call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case  --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
"search just my notes folder

if hostname() == "carlbook.local"
  command! -bang -nargs=* Notes call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, {'dir': '~/Dropbox/epistle/PromptWorks'},  <bang>0)
  command! -bang -nargs=1 NewNote execute 'e ~/Dropbox/epistle/PromptWorks/' . <q-args> . '.md'
  command! Tasks execute 'e ~/Dropbox/epistle/PromptWorks/PW.taskpaper'
else
  command! -bang -nargs=* Notes call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, {'dir': '~/Dropbox/epistle'},  <bang>0)
  command! -bang -nargs=1 NewNote execute 'e ~/Dropbox/epistle/' . <q-args> . '.md'
  command! Tasks execute 'e ~/Dropbox/epistle/Tasks.taskpaper'
endif

"Close all open buffers but the current one (Saves the current one first)
command! BufOnly silent! execute "w|%bd|e#|bd#"
command! Bon silent! execute "w|%bd|e#|bd#"
"close current buffer without closing current window
command! Bd silent! execute "bp|sp|bn|bd"

"ctrlp replacement
map <C-p> :Files<CR>

"vim-closetag settings
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx, *.js'
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.jsx,*.js'
let g:closetag_shortcut = '>'
let g:closetag_close_shortcut = '<leader>>'
"toggele paste in all modes
set pastetoggle=<F10>
"use gf to open filepath under cursor
map gf :e <cfile><CR>

"map leader (space) to switch to last buffer
noremap <Leader>l :b#<CR>

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exe='$(npm bin)/eslint'

"Persistent folds in files
augroup AutoSaveFolds
  autocmd!
  autocmd BufWinLeave * mkview
  autocmd BufWinEnter * silent loadview
augroup END

" ensure hard tabs in taskpaper files
autocmd Filetype taskpaper       set noexpandtab

hi link illuminatedWord Visual
