" le plugins https://github.com/junegunn/vim-plug
" http://patrickmarchand.com/posts/neovim-tuto.html
call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-sensible'
Plug 'benekastah/neomake'
Plug 'Shougo/deoplete.nvim'
Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'

Plug 'altercation/vim-colors-solarized'

" UltiSnips + Snippets
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" NERDtree + git plugin
Plug 'scrooloose/nerdtree', { 'on':  ['NERDTreeToggle', 'NERDTree'] } | Plug 'Xuyuanp/nerdtree-git-plugin'

Plug 'vim-scripts/cream-showinvisibles'

Plug 'jwalton512/vim-blade'

call plug#end()

let g:deoplete#enable_at_startup=1
let mapleader=","

set background=dark
colorscheme solarized

set nomodeline
set cursorcolumn
set cursorline
set backspace=eol,indent,start
set tabstop=4
set showbreak=+++\
set ss=1
set siso=9
set scrolloff=4
set previewheight=7
set splitbelow
set splitright

""""" SNIPPETS """"""
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
""""" END SNIPPETS """""

let g:creamInvisibleShortCut = "<F5>" "for my F4 goto next error
""""" KEYBOARD MAPINGS """""
nnoremap <Leader>s <C-W><C-J>
nnoremap <Leader>w <C-W><C-K>
nnoremap <Leader>d <C-W><C-L>
nnoremap <Leader>a <C-W><C-H>
nnoremap <Leader>q :q<CR>

map <Leader>. :vsp<CR>
map <Leader>- :sp<CR>
map <F3> :source ~/.config/nvim/init.vim<CR>
map <F2> :NERDTreeToggle<CR>
""""" END KEYBOARD MAPINGS """""

""""" AUTO COMMANDS """""
" NERDTree
" Auto open on vim start
"autocmd vimenter * NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Neomake
autocmd! BufWritePost * Neomake
""""" END AUTO COMMANDS """""

" Programming helps
ia #i #include
ia #d #define
ia @p @param
ia @r @return
ia @t @throws
ia @s @see
ia @l @link

" TODO markers
ia t: TODO:
ia T: TODO:
ia //t: // TODO:
ia //T: // TODO:
ia /*t: /* TODO:
ia /*T: /* TODO:
ia "t: " TODO:
ia "T: " TODO:
ia %t: % TODO:
ia %T: % TODO:
ia #t: # TODO:
ia #T: # TODO:

" FIXME markers (I use these to mark temporary code)
ia f: FIXME:
ia F: FIXME:
ia //f: // FIXME:
ia //F: // FIXME:
ia /*f: /* FIXME:
ia /*F: /* FIXME:
ia "f: " FIXME:
ia "F: " FIXME:
ia %f: % FIXME:
ia %F: % FIXME:
ia #f: # FIXME:
ia #F: # FIXME:
