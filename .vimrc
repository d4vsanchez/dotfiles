if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

call plug#begin('~/.vim/plugged')
  " vim-airline
  " https://github.com/vim-airline/vim-airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " editorconfig
  " https://github.com/editorconfig/editorconfig-vim
  Plug 'editorconfig/editorconfig-vim'

  " ack - better grep
  " https://github.com/mileszs/ack.vim
  " (must have ack installed: sudo apt install ack-grep)
  Plug 'mileszs/ack.vim'

  " fzf - better fuzzy search and blazing fast grep
  " https://github.com/junegunn/fzf.vim
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'

  " Syntax highlighting and indenting for JSX
  " https://github.com/mxw/vim-jsx
  Plug 'mxw/vim-jsx'

  " JS bundle for Vim
  " https://github.com/pangloss/vim-javascript
  Plug 'pangloss/vim-javascript'

  " https://github.com/chriskempson/base16-vim
  Plug 'chriskempson/base16-vim'

  " Asynchronous Lint Engine
  " https://github.com/w0rp/ale
  Plug 'w0rp/ale'
  
  " YouCompleteMe
  Plug 'ycm-core/YouCompleteMe'

  " Virtual Environment support for Python projects
  Plug 'plytophogy/vim-virtualenv'

  " Todo list plugin
  Plug 'aserebryakov/vim-todo-lists'

  " NERDTree
  " https://github.com/scrooloose/nerdtree
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
call plug#end()

" Use 24-bit colors
set termguicolors

" Some backspace configuration needed for macOS
set backspace=indent,eol,start

" Number configuration
set number relativenumber

" Relax file compatibility restriction with original vi
" (not necessary to set with neovim, but useful for vim)
set nocompatible

" Use the same style of cursor I have configured in my terminal
set guicursor=

" Disable beep / flash
set vb t_vb=

set guifont="Fira Code":h11

" Set tabs and indents (for JS)
set ts=2
set shiftwidth=2
set ai sw=2

" Replace tabs with spaces
set expandtab

" Allow cursor to move to beginning of tab
" will interfere with soft line wrapping
set list lcs=tab:\ \

" Highlight matches when searching
" Use C-l to clear
set hlsearch

" Disable line wrapping 
" Toggle is set to ',n'
set nowrap

" Enable line and column display
set ruler

" Using vim-airline, hence I don't need showmode
set noshowmode

" File type recognition
filetype on
filetype plugin on
filetype indent on

" Enable syntax highlighting
syntax on

" Scroll a bit horizontally when at the end of the line
set sidescroll=6

" Make it easier to work with buffers
" http://vim.wikia.com/wiki/Easier_buffer_switching
set hidden
set confirm
set autowriteall
set wildmenu wildmode=full

" Open new split panes to right and below (as you probably expect)
set splitright
set splitbelow

" Use Ag (the silver searcher) instack of Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" ======
" Keymap
" ======

" change the leader key from "\" to ","
let mapleader=","

" Shortcut to edit THIS configuration file: (e)dit (c)onfiguration
nnoremap <silent> <leader>ec :e $MYVIMRC<CR>

" Shortcut to source (reload) THIS configuration file after editing it: (s)ource (c)onfiguration
nnoremap <silent> <leader>sc :source $MYVIMRC<CR>

" Toggle line numbers
nnoremap <silent> <leader>n :set number! number?<CR>

" Toggle NERDTree
nnoremap <silent> <Space> :NERDTreeToggle<CR>

" Toggle line wrap
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" Toggle buffer (switch between current and last buffer)
nnoremap <silent> <leader>bb <C-^>

" Go to next buffer
nnoremap <silent> <leader>bn :bn<CR>
nnoremap <C-l> :bn<CR>

" Go to previous buffer
nnoremap <silent> <leader>bp :bp<CR>
nnoremap <C-h> :bp<CR>

" Close buffer
nnoremap <silent> <leader>bd :bd<CR>

" Kill buffer
nnoremap <silent> <leader>bk :bd!<CR>

" List buffers
nnoremap <silent> <leader>bl :ls<CR>

" List and select buffers
nnoremap <silent> <leader>bg :ls<CR>:buffer<Space>

" Horizontal split with new buffer
nnoremap <silent> <leader>bh :new<CR>

" Vertical split with new buffer
nnoremap <silent> <leader>bv :vnew<CR>

" Redraw screen and clear searc highlighted items
nnoremap <silent> <C-L> :nohlsearch<CR><C-L>

" Remap FZF to Ctrl+P
nnoremap <silent> <C-P> :Files<CR>

" Improved support for keyboard navigation
tnoremap <Esc> <C-\><C-n>
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

" ================================
" Vim Airline status configuration
" ================================
let g:airline_theme = 'base16_gruvbox_dark_hard'
let g:airline#extensions#tabline#enabled = 0
let g:airline#extensions#branch#enabled = 1
let g:airline_left_sep = ' »  '
let g:airline_right_sep = ' « '
let g:airline_section_warning = ''
let g:airline_section_y = ''
let g:airline_section_x = ''
set laststatus=2 " for airline

let s:hidden_all = 0
function! ToggleHiddenAll()
  if s:hidden_all == 0
      let s:hidden_all = 1
      set noshowmode
      set noruler
      set laststatus=0
      set noshowcmd
      NERDTreeClose
      set foldcolumn=10
  else
    set foldcolumn=0
    let s:hidden_all = 0
    set showmode
    set ruler
    set laststatus=2
    set showcmd
    wincmd l
  endif
endfunction

nnoremap <silent> <leader>h :call ToggleHiddenAll()<CR>

" ===========
" Custom find
" ===========
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)
" Hide vertical gray bar
set fillchars+=vert:\

" Hightlight current line
autocmd BufEnter * setlocal cursorline
autocmd WinEnter * setlocal cursorline
autocmd BufLeave * setlocal nocursorline
autocmd WinLeave * setlocal nocursorline


" =================
" Ale configuration
" =================

let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
highlight ALEErrorSign ctermbg=NONE ctermfg=red
highlight ALEWarningSign ctermbg=NONE ctermfg=yellow

let g:ale_linters = {
\  'javascript': ['eslint'],
\  'typescript': ['tslint'],
\  'python': ['pylint'],
\}

let g:ale_fixers = {
\  'javascript': ['prettier'],
\  'css': ['prettier'],
\  'typescript': ['tslint'],
\  'python': ['black'],
\}

let g:ale_fix_on_save = 1

" =======
" Gruvbox
" =======
colorscheme base16-material-darker


" Autostart NERDTree when opening a directory
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | wincmd p | endif

" Auto start NERD tree if no files are specified
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | exe 'NERDTree' | endif

" Let quit work as expected if after entering :q the only window left open is NERD Tree itself
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle NERDTree
nnoremap <silent> <Space> :NERDTreeToggle<CR>

