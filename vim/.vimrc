call plug#begin('~/.vim/plugged')

Plug 'ctrlpvim/ctrlp.vim'           " Fuzzy file search
Plug 'easymotion/vim-easymotion'    " Allows you to quickly move to different parts of the file
Plug 'tomtom/tcomment_vim'          " Comment shortchuts
Plug 'airblade/vim-gitgutter'       " Shows git commentary on the side
Plug 'sheerun/vim-polyglot'         " Language packs (sensible defaults for a ton of languages)
Plug 'vim-scripts/ruby-matchit'     " Jump to block end in ruby
Plug 'ngmy/vim-rubocop'             " Auto-complete 'end'
Plug 'tmhedberg/matchit'            " Advanced bracket matching
Plug 'brookhong/ag.vim'             " Use silver-searcher 
Plug 'MarcWeber/vim-addon-mw-utils' " (snippets dependency)
Plug 'tomtom/tlib_vim'              " (snippets dependency)
Plug 'garbas/vim-snipmate'          " Snippets engline
Plug 'honza/vim-snippets'           " Actual snippets of text used by snipmate
Plug 'danro/rename.vim'             " Rename files within cwd
Plug 'scrooloose/nerdtree'          " directory navigation
Plug 'vim-airline/vim-airline'      " Better statusline
Plug 'terryma/vim-expand-region'    " Visually select regions
Plug 'jgdavey/tslime.vim'           " Tmux integration
Plug 'ervandew/supertab'            " Auto-completion with tab
Plug 'vim-syntastic/syntastic'      " Linter integration
Plug 'prashantjois/vim-slack'       " Post to slack directly from vim
Plug 'tpope/vim-endwise'            " intelligently add 'end'
Plug 'tpope/vim-abolish'            " Intellignet search and sub
Plug 'tpope/vim-fugitive'           " Git integration

" Colourschemes
Plug 'jnurmine/Zenburn'

" Syntax highlighting
Plug 'slim-template/vim-slim'           " Slim template (rails)
Plug 'kchmck/vim-coffee-script'         " Coffeescript
Plug 'othree/html5.vim'                 " HTML
Plug 'mustache/vim-mustache-handlebars' " Handlebars (ember.js)
Plug 'jelera/vim-javascript-syntax'     " Javascript

call plug#end()

syntax on                       " enable syntax highlighting
filetype plugin indent on       " indentation based on file type
if has('mouse')
  set mouse-=a                  " allow mouse movements if available (gvim or such)
endif
set re=1                        " This fixes the problem with slowness in ruby syntax highlighting
set relativenumber              " display how far away each line is from the current one, instead of showing the absolute line number.
set showcmd                     " show incomplete commands
set scrolloff=5                 " lines to keep when scrolling
set wrap                        " wrap text when displaying (does not alter the line)
set showmatch                   " show matching parentheses
set undofile                    " preserve undo on exit
set clipboard=unnamed           " allow yank and paste from clipboard if available
set hidden                      " allow switching buffers without save
set relativenumber              " display how far away each line is from the current one, instead of showing the absolute line number.
set visualbell                  " don't beep just flash the screen
set expandtab                   " (insert) insert space whenever a tab key is pressed
set tabstop=2                   " (insert) number of spaces in a tab
set shiftwidth=2                " (insert) number of spaces characters used for indentation
set autoindent                  " (insert) copy indent from current line when going to next line
set smartindent                 " (insert) smart autoindenting when starting a new line
set nocindent                   " (insert) do not use cindent indenting mode
set backspace=indent,eol,start  " (insert) make backspace work like in most programs
set hlsearch                    " (normal) highlight search terms
set incsearch                   " (normal) show found search term as you type (emacs style)
set ignorecase                  " (normal) case-insensitve search
set smartcase                   " (normal) make searches case-insensitive except when you include upper-case characters
set pastetoggle=<F2>            " (normal) when pasting ignore auto indentation rules"
set wildmenu                    " (normal) menu autocomplete
let mapleader = "\<Space>"      " (normal) map leader to space bar

" Stop that stupid window from popping up
map q: :q

" jk to escape into normal mode
inoremap jk <ESC>

" Type <Space>w to save file
nnoremap <Leader>w :w<CR>

" Type <Space>q to close buffer
nnoremap <Leader>q :bd<CR>

" Type <Space>Q to quit
nnoremap <Leader>Q :q<CR>

" Automatically jump to end of text you pasted
vnoremap <silent> y y`]
vnoremap <silent> p p`]
nnoremap <silent> p p`]

" allow the . to execute once for each line of a visual selection
vnoremap . :normal .<CR>

" Buffer shortcuts
nnoremap <Tab> :bn<CR>
nnoremap <S-Tab> :bp<CR>

" Select word easily
nnoremap vv viw

" Search and replace visually selected text
vnoremap <C-r> "hy:%s/<C-r>h//g<left><left>

" Create a new file in cwd instead of at root of vim process
nnoremap <C-T> :e %:h/

" Each time a new or existing file is edited, Vim will try to " recognize the type of the file and set the 'filetype' option.
" This will trigger the FileType event, which can be used to set " the syntax highlighting, set options, etc.
filetype on

" when a file is edited its plugin file is loaded (if there is one for the detected filetype).
filetype plugin on 

" when a file is edited its indent file is loaded (if there is one for the detected filetype).
filetype indent on

" Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'

" CTRL-P
nnoremap <Leader>o :CtrlPCurWD<CR>
nnoremap <Leader>i :CtrlPTag<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

" File search
if executable('ag')
  " Use ag over grep
  let ag_options = '-l --nocolor -g ""'

  " Use ag in CtrlP and Ack for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s ' . ag_options
  " quick search prompt
  nnoremap <Leader>g :Ag! 
  
  " bind visual mode <leader>g to grep selected text
  vnoremap <Leader>g y:Ag! <C-R>"
endif

" bind normal mode K to search word under cursor
nnoremap K :Ag! "\b<C-R><C-W>\b"<CR>:cw

" bind visual mode K to search selection in all files
vnoremap K y:Ag! "<C-R>""

" bind visual mode // to search current file for selected text
vnoremap // y/<C-R>"<CR>

" bind visual mode // to search current file for selected text
vnoremap // y/<C-R>"<CR>

" Eeasymotion
" Use comma in normal mode to perform bi-directional search
nmap , <Plug>(easymotion-bd-w)

" Zenburn (colorscheme)
let g:zenburn_transparent = 1
colorscheme zenburn
hi QuickFixLine term=reverse guibg=Cyan ctermbg=52

" Snipmate
" Snippet trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" NerdTree
" open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive' }
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Slack
let g:slack_vim_token="xoxp-xxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxx-xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
let g:slack_email_domain="jois.ca"
