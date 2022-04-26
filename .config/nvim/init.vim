let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin(stdpath('data') . '/plugged')

  " Theme: OneDark
  " Plug 'joshdick/onedark.vim'
  " Theme: Gruvbox Dark
  Plug 'morhetz/gruvbox'

  " Language packs
  Plug 'sheerun/vim-polyglot'

  " Vim Airline
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " Linting/Language servers/Autocomplete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " Fuzzy finder
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Argwrap
  Plug 'FooSoft/vim-argwrap'

  " Easymotion
  Plug 'easymotion/vim-easymotion'

  " Prettier
  Plug 'prettier/vim-prettier', {
        \ 'do': 'yarn install',
        \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'svelte', 'yaml', 'html']
        \ }

  " Commentary
  Plug 'tpope/vim-commentary'

  " Autoclose brackets
  Plug 'Raimondi/delimitMate'

  " File explorer
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'kyazdani42/nvim-tree.lua'

  " Multiple cursors
  Plug 'terryma/vim-multiple-cursors'

call plug#end()

" Use spaces instead of tabs
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab

" Use 24-bit (true-color) mode in Neovim when outside Tmux
if (empty($TMUX))
  if (has('nvim'))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has('termguicolors'))
    set termguicolors
  endif
endif

syntax on
set background=dark
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'hard'

" Clipboard configuration
" Use system's clipboard for Vim 
set clipboard=unnamedplus

" Splits
" When splitting vertically, send the split to the right
set splitright
" When splitting horizontally, send the split to the bottom
set splitbelow

" Show the line numbers
set rnu

" Highlight current line number that is selected
set cursorline
set cursorlineopt=number

" Show tab as characters
set list
set listchars=tab:→\ ,trail:·,extends:⋯,precedes:⋯,nbsp:~

" Do not wrap text overflowing the window width
set nowrap

" Fix backspace behavior in macOS
set backspace=indent,eol,start

" Prevent comments from being auto-inserted when pressing O
autocmd FileType * setlocal formatoptions-=c formatoptions-=o

" Set comma (,) as the leader key
let mapleader=','

" Split navigation mappings
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" Clear search buffer when pressing double-Esc 
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

" Remove backup files
set nobackup
set nowritebackup

" Always show signcolumn, otherwise it will shift the text each time
" diagnostics appear/become resolved
if has('nvim-0.5.0') || has('patch-8.1.1564')
  set signcolumn=number
else
  set signcolumn=yes
endif

" Ignore casing in search
set ignorecase

" Set font
set guifont=Fira_Code:h13

" Prevent modifying the terminal cursor styke
set guicursor=

" =====================
" Airline configuration
" =====================
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enbled = 1
let g:airline_theme='onedark'

" =====================
" Argwrap configuration
" =====================

" Wrap arguments when pressing <Leader>a
nnoremap <silent> <Leader>a :ArgWrap<CR>

" =================
" CoC configuration
" =================

" Set internal encoding of Vim
set encoding=utf-8

" TextEdit might fail if hidden is not set
set hidden

" Give more space for displaying messages
set cmdheight=2

" Having longer update time leads to delay and poor UX
set updatetime=300

" Don't pass messages to |ins-completion-menu|
set shortmess+=c

" Use tab to trigger completion with characters ahead and navigate
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
if has('nvim')
  noremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Run the Code Lens action on the current line.
nmap <leader>cl  <Plug>(coc-codelens-action)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" ======================
" Prettier Configuration
" ======================
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat_require_pragma = 0
let g:prettier#autoformar_config_present = 1

" =======================
" Telescope Configuration
" =======================
nnoremap <Leader>f <cmd>Telescope find_files<CR>
nnoremap <Leader>b <cmd>Telescope buffers<CR>
nnoremap <C-f> <cmd>Telescope live_grep<CR>

" ===========================
" File Explorer Configuration
" ===========================
nnoremap <silent> <C-b> :NvimTreeToggle<CR>
highlight NvimTreeFolderIcon guifg=orange
highlight NvimTreeFolderName guifg=fg0
highlight NvimTreeGitDirty guifg=red
highlight NvimTreeOpenedFolderName guifg=fg0
highlight NvimTreeEmptyFolderName guifg=fg0
highlight NvimTreeIndentMarker guifg=orange

