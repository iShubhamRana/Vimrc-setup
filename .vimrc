set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set relativenumber
set nohlsearch
set smartindent
set hidden
set nowrap
set nu
set noerrorbells
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set scrolloff=8
set termguicolors
set noshowmode
set signcolumn=yes
set complete+=kspell
set completeopt=menuone,longest
set shortmess+=c
set transparency=20 
set blurradius=90
let g:AutoPairsFlyMode = 1

let c='a'
while c <= 'z'
  exec "set <A-".c.">=\e".c
  exec "imap \e".c." <A-".c.">"
  let c = nr2char(1+char2nr(c))
endw

set timeout ttimeoutlen=50

call plug#begin('~/.vim/plugged')
Plug 'gruvbox-community/gruvbox'
Plug 'vim-scripts/AutoComplPop'
Plug 'jiangmiao/auto-pairs'
call plug#end()

fun! TrimWhiteSpace()
    let l:save=winsaveview()
    keeppatterns %s/\s\+$//e
    call winrestview(l:save)
endfun 

augroup THE_PRIMEAGEN
    autocmd!
    autocmd BufWritePre *: call TrimWhiteSpace()
augroup END

colorscheme gruvbox
highlight Normal guibg=none


nnoremap <silent> <Leader>c :call QuickFix_toggle()<CR>

" Convert the selected text's title case using the external tcc script.
"   Requires: https://github.com/nickjj/title-case-converter
vnoremap <Leader>tc c<C-r>=system('tcc', getreg('"'))[:-2]<CR>

" Navigate the complete menu items like CTRL+n / CTRL+p would.
inoremap <expr> <Down> pumvisible() ? "<C-n>" :"<Down>"
inoremap <expr> <Up> pumvisible() ? "<C-p>" : "<Up>"

" Select the complete menu item like CTRL+y would.
inoremap <expr> <Right> pumvisible() ? "<C-y>" : "<Right>"
inoremap <expr> <CR> pumvisible() ? "<C-y>" :"<CR>"

" Cancel the complete menu item like CTRL+e would.
inoremap <expr> <Left> pumvisible() ? "<C-e>" : "<Left>"
