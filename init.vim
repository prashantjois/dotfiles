call plug#begin('~/.vim/plugged')
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'mileszs/ack.vim'
Plug 'kien/ctrlp.vim'
Plug 'jnurmine/Zenburn'
Plug 'easymotion/vim-easymotion'
Plug 'tomtom/tcomment_vim'
Plug 'thoughtbot/vim-rspec'
Plug 'slim-template/vim-slim'
call plug#end()

syntax on                       " enable syntax highlighting
filetype plugin indent on       " indentation based on file type
set re=1                        " This fixes the problem with slowness in ruby syntax highlighting http://stackoverflow.com/a/16920294/1464892
set number 		                  " Show line numbers
set showcmd 		                " show incomplete commands
set scrolloff=5                 " lines to keep when scrolling
set wrap                        " wrap text when displaying (does not alter the line)
set showmatch                   " show matching parentheses
set undofile                    " preserve undo on exit
set mouse-=a                    " prevent the behaviour where selecting text enters visual mode
set expandtab                   " (insert) insert space whenever a tab key is pressed
set tabstop=2                   " (insert) number of spaces in a tab
set shiftwidth=2                " (insert) number of spaces characters used for indentation
set autoindent                  " (insert) copy indent from current line when going to next line set smartindent
set nocindent                   " (insert) do not use cindent indenting mode
set hlsearch                    " (normal) highlight search terms
set incsearch                   " (normal) show found search term as you type
set pastetoggle=<F2>            " (normal) when pasting ignore auto indentation rules"
set wildmenu                    " (normal) menu autocomplete

let mapleader = "\<Space>"      " (normal) map leader to space bar
let g:ruby_path="/usr/bin/ruby" "

" Zenburn colorscheme
let g:zenburn_transparent = 1
colorscheme zenburn

" jk to escape into normal mode
inoremap jk <ESC>
" Type <Space>w to save file
nnoremap <Leader>w :w<CR>
" Type <Space>q to quit
nnoremap <Leader>q :q<CR>

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" Stop that stupid window from popping up
map q: :q

" Specific indentation rules by file type
if has("autocmd")
  au FileType cpp,c,java,sh,pl,php set cindent
  au BufRead *.py set cinwords=if,elif,else,for,while,try,except,finally,def,class
  au BufRead *.rb set cinwords=if,elsif,else,unless,for,while,begin,rescue,def,class,module
endif

" Global Mappings
nnoremap t :tabnext<CR>
nnoremap T :tabprev<CR>

" Use silver-searcher with Ack
let g:ackprg = '/usr/bin/ag --column'
nnoremap <leader>a :Ack!<space>

" CTRL-P
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :CtrlPTag<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" Use comma in normal mode to perform bi-directional easymotion
nmap , <Plug>(easymotion-bd-w)

" Open tag in new tab
:nnoremap <silent><Leader>c <C-w><C-]><C-w>T

" vim rspec
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>f  :call RunCurrentSpecFile()<CR>
