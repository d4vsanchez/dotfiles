call plug#begin(stdpath('data') . '/plugged')

    " Theme: OneDark
    Plug 'joshdick/onedark.vim'

    " Conquer of Completion
    " Support autocompletion like VSCode
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Fuzzy finder
    " Better search for buffers, files and text
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

    " Autoclose brackets, parenthesis, quotes, etc.
    Plug 'Raimondi/delimitMate'

    " Comment lines
    Plug 'tpope/vim-commentary'

    " Improve motion keybindings
    Plug 'easymotion/vim-easymotion'

    " Improve status line in Vim
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    " Language packs for Vim
    Plug 'sheerun/vim-polyglot'

    " File tree
    Plug 'kyazdani42/nvim-tree.lua'

    " Add tabs support
    Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }

    Plug 'folke/which-key.nvim'


call plug#end()

