" VIM Configuration File
" Description: Optimized for C/C++ development, but useful also for other things.
" Author: Gerhard Gappmeier

filetype off
call pathogen#incubate()
filetype plugin indent on
syntax on

set nocompatible              " be iMproved, required

set modelines=0

set tabstop=4        " tab width is 4 spaces
set shiftwidth=4     " indent also with 4 spaces
set expandtab        " expand tabs to spaces
set textwidth=120    " wrap lines at 120 chars
" visible right margin indicator
" set colorcolumn=120

set backspace=indent,eol,start
set ruler
" turn line numbers on
set number
set showcmd
set incsearch
set hlsearch

" set UTF-8 encoding
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8

set autoindent " use indentation of previous line
set smartindent " use intelligent indentation for C

set t_Co=256 " turn syntax highlighting on

set tabpagemax=100

let g:airline_powerline_fonts = 1

" The following is to get tab functionality via buffers
" -----------------------------------------------------
" Enable the list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show just the filename
let g:airline#extensions#tabline#fnamemod = ':t'

let mapleader=" "
" This allows buffers to be hidden if you've modified a buffer.
" This is almost a must if you wish to use buffers in this way.
set hidden
" To open a new empty buffer
" This replaces :tabnew which I used to bind to this mapping
nmap <leader>T :enew<cr>
" Move to the next buffer
nmap <leader>l :bnext<CR>
" Move to the previous buffer
nmap <leader>h :bprevious<CR>
" Close the current buffer and move to the previous one
" This replicates the idea of closing a tab
nmap <leader>bq :bp <BAR> bd #<CR>
" Show all open buffers and their status
nmap <leader>bl :ls<CR>
" end of tab functionality via buffers
" ------------------------------------

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_working_path_mode = 'ra'
let g:nerdtree_tabs_open_on_console_startup=1

set statusline=%t
noremap - :s/^\/\///<CR>

hi User1 guifg=#ffdad8  guibg=#880c0e
hi User2 guifg=#000000  guibg=#F4905C
hi User3 guifg=#292b00  guibg=#f4f597
hi User4 guifg=#112605  guibg=#aefe7B
hi User5 guifg=#051d00  guibg=#7dcc7d
hi User7 guifg=#ffffff  guibg=#880c0e gui=bold
hi User8 guifg=#ffffff  guibg=#5b7fbb
hi User9 guifg=#ffffff  guibg=#810085
hi User0 guifg=#ffffff  guibg=#094afe

set statusline=
set statusline+=%7*\[%n\ %t]                                "buffernr+filename
set statusline+=%2*\ %y\                                  "FileType
set statusline+=%8*\ %=\ row:%l/%L\ (%03p%%)\             "Rownumber/total (%)
set statusline+=%9*\ col:%03c\                            "Colnr
set statusline+=%0*\ \ %m%r%w\ %P\ \                      "Modified? Readonly? Top/bot.
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

execute pathogen#infect()
call pathogen#helptags() "If you like to get crazy :)

colorscheme wombat256
" colorscheme gummybears
" set background=dark

" highlight matching braces
set showmatch
" intelligent comments
set comments=sl:/*,mb:\ *,elx:\ */

" Enhanced keyboard mappings

" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
" goto definition with F12
map <F12> <C-]>
map <Leader>n <plug>NERDTreeTabsToggle<CR>

" in diff mode we use the spell check keys for merging
if &diff
  " diff settings
  map <M-Down> ]c
  map <M-Up> [c
  map <M-Left> do
  map <M-Right> dp
  map <F9> :new<CR>:read !svn diff<CR>:set syntax=diff buftype=nofile<CR>gg
" else
  " spell settings
  " :setlocal spell spelllang=en
  " set the spellfile - folders must exist
  " set spellfile=~/.vim/spellfile.add
  " map <M-Down> ]s
  " map <M-Up> [s
endif

highlight ExtraWhitespace ctermbg=darkgreen guibg=lightgreen
" Show trailing whitespace:
match ExtraWhitespace /\s\+$/
" Show trailing whitespace and spaces before a tab:
match ExtraWhitespace /\s\+$\| \+\ze\t/
" Show tabs that are not at the start of a line:
match ExtraWhitespace /[^\t]\zs\t\+/

" IMPORTANT: grep will sometimes skip displaying the file name if you
" search in a singe file. This will confuse Latex-Suite. Set your grep
" program to always generate a file-name.
set grepprg=grep\ -nH\ $*

" OPTIONAL: This enables automatic indentation as you type
filetype indent on

" OPTIONAL: Starting with Vim 7, the filetype of empty .tex files defaults to
" 'plaintex' instead of 'tex', which results in vim-latex not being loaded.
" The following changes the default filetype back to 'tex'
let g:tex_flavor='latex'

