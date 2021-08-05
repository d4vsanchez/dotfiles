" Set compatibility to Vim only
set nocompatible
set nolist
set rnu
" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" For plug-ins to load correctly
filetype plugin indent on

" Turn off modelines
set modelines=0

let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Disable ALE LSP in order to integrate CoC with ALE
let g:ale_disable_lsp = 1

" Plug plugins configuration
call plug#begin('~/.vim/plugged')
    " Set the file's root directory (the one with .git) as cwd
    Plug 'airblade/vim-rooter'

    " This is the theme of my preference.
    Plug 'joshdick/onedark.vim'
    Plug 'sheerun/vim-polyglot'

    " This is a plugin to support EditorConfig
    Plug 'editorconfig/editorconfig-vim'

    " This is a plugin to support Prettier
    Plug 'prettier/vim-prettier'

    " This is a plugin to get auto-completions
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " This is a plugin to support linting of files
    Plug 'dense-analysis/ale'

    " Add support for Emmet syntax
    Plug 'mattn/emmet-vim'

    " Improve the search of files or lines of code
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " Add Git features to Vim
    Plug 'tpope/vim-fugitive'

    Plug 'Yggdroot/indentLine'

    Plug 'pangloss/vim-javascript'
    Plug 'leafgarland/typescript-vim'
call plug#end()

" Use comma to move between panes
nnoremap <silent> <Leader><Left> :bp<CR>
nnoremap <silent> <Leader><Right> :bn<CR>
nnoremap <silent> <Leader>w :bdelete<CR>

" Set the <Leader> character as comma
let mapleader=','

" Keep the mouse cursor that is default for the terminal emulator
set guicursor=

" Set the font of the gui
set guifont=Hack\ Nerd\ Font\ Mono:h13

" Set internal encoding of Vim to UTF-8
set encoding=utf-8

" Fix the backspace behavior in macOS
set backspace=indent,eol,start

set number

" Display 5 lines above/below the cursor when scrolling with a mouse
set scrolloff=5
" Speed up scrolling in Vim
set ttyfast

" Highlight matching pairs of brackets. Use the '%' character to jump between
" them
set matchpairs+=<:>

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Use 24-bit (true-color) mode in Vim when outside tmux.
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Activate the Material Darker theme
syntax on
let g:onedark_terminal_italics = 1
colorscheme onedark

" Use spaces instead of tabs, always
" tabstop -> The width of a tab character measured in spaces.
" softtabstop -> Setting non-zero value will make the tab key to insert a
"                combination of tabs and spaces in order to simulate tab stops
"                at the given width
" shiftwidth -> The size of an indent measured in spaces.
" expandtab -> Will make the tab key to insert spaces, like a normal person.
set textwidth=79
set formatoptions=tcqn1
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab

" Automatically wrap text that extends beyond the screen length
set wrap

" Prevent Vim from inserting comment leader after hitting <Enter>
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" ==========================
" EditorConfig Configuration
" ==========================

" According to the EditorConfig plugin, this is needed to work correctly with the Fugitive
" plugin
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" ======================
" Prettier Configuration
" ======================

" Auto-format files
let g:prettier#autoformat_require_pragma = 0
" Only autoformat if there's a config file present
let g:prettier#autoformat_config_present = 1
" Set the :Prettier command to be async
let g:prettier#exec_cmd_async = 1

" =================
" CoC Configuration
" =================

" Use tab to trigger completion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" ====================
" ESLint Configuration
" ====================

" Set the list of linters to be executed
let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop'],
\   'python': ['pylint']
\}

" Set the fixers
let g:ale_fixers = {
\   '*': ['trim_whitespace'],
\}

let g:ale_fix_on_save = 1

" =================
" FZF Configuration
" =================

nnoremap <silent> <Leader>p :Files<CR>
nnoremap <silent> <Leader>P :GitFiles<CR>
nnoremap <silent> <Leader>f :Rg<CR>

