" Set space as the leader key
map , <Leader>

" ==============
" Extra Bindings
" ==============
nnoremap <silent> <Esc><Esc> :let @/ = ""<CR>

" =========================
" Split Navigation Mappings
" =========================
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

" ==================
" Telescope Mappings
" ==================
nnoremap <Leader>f :Telescope fd<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <C-f> :Telescope live_grep<CR>

" ==================
" Nvim Tree Mappings
" ==================
nnoremap <silent> <C-b> :NvimTreeToggle<CR>

" ============
" CoC Mappings
" ============
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" Trigger completion with characters ahead
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ CheckBackspace() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use Ctrl + Space to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

