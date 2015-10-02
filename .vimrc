" Pathogen plugin manageer
execute pathogen#infect()

" Display Options
syntax on
filetype plugin indent on
set number 		" Show line numbers
set pastetoggle=<F2>    " Set paste mode toggle key
set showcmd 		" show incomplete commands
set scrolloff=5 	" lines to keep when scrolling
set title                       " show title in console title bar
set wrap                        " wrap text when displaying (does not alter the line)
set encoding=utf-8              " self-explanatory

" Editing Options
set expandtab                   " (insert) insert space whenever a tab key is pressed
set tabstop=2                   " (insert) number of spaces in a tab
set shiftwidth=2                " (insert) number of spaces characters used for indentation
set autoindent                  " (insert) copy indent from current line when going to next line set smartindent                 " (insert) smart indenting mode
set nocindent                   " (insert) do not use cindent indenting mode
set hlsearch                    " (normal) highlight search terms
set incsearch                   " (normal) show found search term as you type
set pastetoggle=<F2>            " (normal) when pasting ignore auto indentation rules"
let mapleader = "\<Space>"      " (normal) map leader to space bar

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
nnoremap <C-t> :tabnew<CR>:NERDTree<CR>

" CTRL-P
nnoremap <Leader>o :CtrlP<CR>
nnoremap <Leader>i :CtrlPTag<CR>

" Zenburn colorscheme
let g:zenburn_transparent = 1
colorscheme zenburn

" NERDTree Directory Browsing
let NERDTreeDirArrows=0
let NERDTreeQuitOnOpen=1
map <C-n> :NERDTreeToggle<CR>	

" VIM Airline status bar
let g:airline_powerline_fonts = 1
set laststatus=2

" Gundo mapping
nmap <F5> :GundoToggle<CR>

" Expand Region
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" Use ag instead of grep if available
if executable('ag')
  set grepprg=ag\ --nogroup\ --nocolor
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  let g:ctrlp_use_caching = 0
endif

" bind K to grep word under cursor
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>

" matchit plugin for texobj-rubyblock
runtime macros/matchit.vim

" vim rspec
nnoremap <Leader>s :call RunNearestSpec()<CR>
nnoremap <Leader>f  :call RunCurrentSpecFile()<CR>

" Make it obvious where 80 characters is
set colorcolumn=+1

" persistent undo
let vimDir = '$HOME/.vim'
let &runtimepath.=','.vimDir

" Keep undo history across sessions by storing it in a file
if has('persistent_undo')
    let myUndoDir = expand(vimDir . '/undodir')
    " Create dirs
    call system('mkdir ' . vimDir)
    call system('mkdir ' . myUndoDir)
    let &undodir = myUndoDir
    set undofile
endif

" Open tag in new tab
:nnoremap <silent><Leader>c <C-w><C-]><C-w>T

" very magic regex by default
nnoremap / /\v
vnoremap / /\v
cnoremap %s/ %smagic/
cnoremap \>s/ \>smagic/
nnoremap :g/ :g/\v
nnoremap :g// :g//
