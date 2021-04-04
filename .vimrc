if empty(glob("~/.vim" . '/autoload/plug.vim'))
    silent execute '!curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source ~/.vimrc
endif

" Disable ALE LSP in order to integrate CoC with ALE
let g:ale_disable_lsp = 1

" Plug plugins configuration
call plug#begin('~/.vim/plugged')
    " Set the file's root directory (the one with .git) as cwd
    Plug 'airblade/vim-rooter'

    " This is the theme of my preference: One Dark Pro.
    Plug 'joshdick/onedark.vim'

    " This is a package that's recommended by One Dark Pro, improve syntax
    " highlighting for multiple packages.
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

    " Adds a bottom bar with information
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
call plug#end()

" Set the <Leader> character as comma
let mapleader=','

" Set the font of the gui
set guifont=Hack\ Nerd\ Font\ Mono:h13

" Set internal encoding of Vim to UTF-8
set encoding=utf-8

" Fix the backspace behavior in macOS
set backspace=indent,eol,start

set number

" Use 24-bit (true-color) mode in Vim when outside tmux.
if (empty($TMUX))
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" Activate the One Dark Pro theme
syntax on
let g:onedark_hide_endofbuffer = 1 " Hide some ~ characters added by the theme
colorscheme onedark

" Use spaces instead of tabs, always
" tabstop -> The width of a tab character measured in spaces.
" softtabstop -> Setting non-zero value will make the tab key to insert a
"                combination of tabs and spaces in order to simulate tab stops
"                at the given width
" shiftwidth -> The size of an indent measured in spaces.
" expandtab -> Will make the tab key to insert spaces, like a normal person.
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

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
nnoremap <silent> <Leader>f :Rg<CR>

" =========================
" Vim Airline Configuration
" =========================

let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
