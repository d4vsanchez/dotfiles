set nocompatible

source ~/.config/nvim/plugins.vim
source ~/.config/nvim/vimscript/bindings.vim
source ~/.config/nvim/vimscript/colors.vim

luafile ~/.config/nvim/lua/nvimtree.lua
luafile ~/.config/nvim/lua/_bufferline.lua

" =============
" Configuration
" =============
syntax enable
set mouse=a
set hidden
set splitbelow
set splitright
set number relativenumber
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set termguicolors
set clipboard=unnamedplus
set fillchars+=vert:\|
set expandtab
set shiftwidth=4
set softtabstop=4
set listchars=tab:→\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~
set smartindent
set autoindent
set updatetime=300
set conceallevel=0
set shortmess+=c
set timeout
set ignorecase
set nobackup
set nowritebackup
set cmdheight=2
set signcolumn=number

" Do not automatically add comments when pressing O
autocmd FileType * setlocal formatoptions-=c formatoptions-=o

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Integrate with neovim statusline support
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

