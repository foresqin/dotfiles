set number relativenumber
set cursorline
set smartcase
set hidden
set mouse=a

nnoremap n nzz
nnoremap N Nzz

nnoremap y "+y
nnoremap yy "+yy
nnoremap Y "+Y
vnoremap y "+y
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>yy "+yy


nnoremap <C-j> :bn<CR>
nnoremap <C-k> :bp<CR>

vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

""" auto set cwd to the buffer's location
autocmd BufEnter * if index(['terminal', 'nofile'], &buftype) < 0 && expand('%:p') != ''
    \ | silent! execute 'lcd' fnameescape(expand('%:p:h'))
    \ | endif


""" vundle 
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'mbbill/undotree'
Plugin 'preservim/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'fatih/vim-go'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'masukomi/vim-markdown-folding'
Plugin 'luisjure/csound-vim'
call vundle#end()

call plug#begin('~/.vim/plugged')
Plug 'jremmen/vim-ripgrep'
call plug#end()

filetype plugin indent on

""" easymotion
let g:EasyMotion_smartcase = 1
nmap ,w <Plug>(easymotion-overwin-w)
nmap ,j <Plug>(easymotion-j)
nmap ,k <Plug>(easymotion-k)
nmap ,f <Plug>(easymotion-f)
nmap ,F <Plug>(easymotion-F)
nmap ,( <Plug>(easymotion-bd-[)
nmap ,) <Plug>(easymotion-bd-])
map ,/ <Plug>(easymotion-sn)

""" NERDTree
autocmd VimEnter * if argc() == 0 | NERDTree | endif
nnoremap ,n :NERDTreeCWD<CR>

""" vimwiki
let g:vimwiki_list = [{'path': '~/vimwiki/', 'path_html': '~/cerebra/export/html/'}]


nnoremap \w\p :VimwikiDiaryPrevDay<CR>
nnoremap \w\n :VimwikiDiaryNextDay<CR>
nnoremap \w\d :VimwikiDiaryIndex<CR>

""" fzf
nnoremap <C-p> :Files  ~/<CR>
nnoremap <C-f> :Files<CR>
nnoremap <C-l> :Lines<CR>
nnoremap <C-b> :BLines<CR>
nnoremap <C-q> :Buffers<CR>

""" undotree
nnoremap <leader>u :UndotreeToggle<CR>

""" ripgrpe
nnoremap <C-s> :Rg<Space>

""" put all buffer in tabs
nnoremap <leader>t :tabonly \| bufdo tab split<CR>


