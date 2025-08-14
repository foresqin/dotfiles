set number relativenumber
set cursorline
set smartcase
set hidden

nnoremap n nzz
nnoremap N Nzz

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
Plugin 'preservim/nerdtree'
Plugin 'vimwiki/vimwiki'
Plugin 'fatih/vim-go'
Plugin 'easymotion/vim-easymotion'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'plasticboy/vim-markdown'
Plugin 'luisjure/csound-vim'
call vundle#end()

call plug#begin('~/.vim/plugged')
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' }
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
let g:vimwiki_list = [{'path':'~/vimwiki', 'path_html':'~/cerebra/export/html/'}]
nnoremap \w\p :VimwikiDiaryPrevDay<CR>
nnoremap \w\n :VimwikiDiaryNextDay<CR>
nnoremap \w\d :VimwikiDiaryIndex<CR>

""" fzf
nnoremap <C-p> :Files  ~/<CR>
nnoremap ,,f :Files<CR>
nnoremap <C-q> :Buffers<CR>

""" leaderf
" unset \f
let g:Lf_ShortcutF = '' 
nnoremap <leader>b :LeaderfBuffer<CR>
nnoremap <leader>l :LeaderfLine<CR>
nnoremap <leader>r :LeaderfRgInteractive<CR>

nnoremap <C-b> :LeaderfBuffer<CR>
nnoremap <C-l> :LeaderfLine<CR>


