if has('gui_running')
  set hlsearch "highlight search"
  set incsearch "search while typing"
	set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 9
endif
set background=dark 
set number
set hlsearch 
set wrap!
set nowrap "dont wrap lines
set scrolloff=2 "2 lines above/below cursor when scrolling
set showmatch "show matching brackets"
set laststatus=2 "use 2 lines for status bar"
set matchtime=2 "show matching brackets for 0.5 seconds"
set matchpairs+=<:> "matching for html"
set showmode "show mode in status bar"
set wildmenu "completion with menu"
set formatoptions-=t
set showtabline=2
set laststatus=2
set bs=indent,eol,start "Allow backspacing over everything in insert mode
set nocompatible "be iMproved, required
filetype on " required
filetype plugin indent on
syntax on
set grepprg=grep\ -nH\ $*
set fileformat=unix
set encoding=utf-8
set showcmd
set autoindent
set mouse=a
set guioptions -=m "hide menubar
set guioptions -=T "hide toolbar
set ignorecase "incase sensitive searching /
set smartcase " ^
set clipboard=unnamed
set clipboard=unnamedplus "Clipboard for cut copy paste
set confirm
set viminfo='20,\"500 "remember copy register after quitting
set hidden "remember undo after quitting"
set history=50
set cursorline
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Bundle 'L9'
Plugin 'tpope/vim-fugitive' "git wrapper
Plugin 'scrooloose/nerdtree'
Plugin 'universal-ctags/ctags'
Plugin 'xolox/vim-misc' "needed for easytags
Plugin 'xolox/vim-easytags'
Plugin 'majutsushi/tagbar' "tagbar for class, function, etc
Plugin 'kien/ctrlp.vim' "fuzzy finding
Plugin 'Townk/vim-autoclose' " auto close ( ' [ 
Plugin 'alvan/vim-closetag' " auto close html tags
Plugin 'tpope/vim-surround' "change surrounding bracket or tags 
Plugin 'tpope/vim-eunuch' "Unix shell command in VIM like delete, rename,chmod, mkdir
Plugin 'tomtom/tcomment_vim' "comment 1 line : ctrl+k, multi line :gcc
Plugin 'vim-syntastic/syntastic' "Syntax checking
Plugin 'mhinz/vim-startify' "startify recent opened files on start page
Plugin 'roxma/vim-paste-easy' "automatically set paste
Plugin 'Badacadabra/vim-archery' "good colorscheme
Plugin 'juneedahamed/svnj.vim' "vim Subversion VCS
Plugin 'itchyny/lightline.vim' "Status line
Plugin 'Yggdroot/indentLine' "Indentation marker
Plugin 'flazz/vim-colorschemes' "Colorscheme collection
Plugin 'kristijanhusak/vim-hybrid-material' "Colorscheme
Plugin 'gregsexton/MatchTag' "show start and end tags
Plugin 'shawncplus/phpcomplete.vim'
" Bundle 'Shougo/vimproc'
" Bundle 'Shougo/unite.vim'
" Bundle 'm2mdas/phpcomplete-extended'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Bundle 'honza/vim-snippets'
Plugin 'joshdick/onedark.vim'
Plugin 'gko/vim-coloresque'
Plugin 'prettier/vim-prettier'
Plugin 'lambdalisue/vim-fullscreen'
Plugin 'Chiel92/vim-autoformat'
Plugin 'liuchengxu/space-vim-dark'
if has('nvim')
  Plugin 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plugin 'Shougo/deoplete.nvim'
  Plugin 'roxma/nvim-yarp'
  Plugin 'roxma/vim-hug-neovim-rpc'
endif
let g:deoplete#enable_at_startup = 1
" Plugin 'severin-lemaignan/vim-minimap'
" Plugin 'Twinside/vim-codeoverview'
"All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
let g:lightline = {
    \ 'colorscheme': 'archery',
        \ }
" if $TERM == "xterm-256color"
"   set t_Co=256
" endif
"colorscheme hybrid_material
colorscheme hybrid_reverse
"colorscheme archery

cd /mnt/Workspace/xampp/htdocs/
" autocmd Filetype css,php,html setlocal tabstop=8 "Set indentation size
set tabstop=2 shiftwidth=2 expandtab
nmap <esc> :noh<CR>
map <C-a> ggVG<CR>
map <C-t> :tabnew<CR>
map <C-m> :tabnext<CR>
map <C-n> :tabprev<CR>
vnoremap <C-c> "+y
vnoremap <C-x> "+x
map <Del> "_x
map <C-v> "+gP
map <F1> <nop>
map <F2> :NERDTreeToggle<CR>
silent! map <F3> :NERDTreeFind<CR>
let g:NERDTreeMapActivateNode="<F3>"
map <Leader>nt :NERDTree %:p:h<CR>
map <F4> :TagbarToggle<CR>
map <F5> :Startify<CR>
nnoremap <C-k> :TComment<CR> 
nnoremap <silent> <C-S> :<C-u>Update<CR> 
nmap <F6> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>
map <silent> <F11>
\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>
set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END runtime macros/matchit.vim "block starting tags to closing let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php' "set <html> autoclose tag in these files

" Indentation marker 
"let g:indentLine_bgcolor_term = 202
"let g:indentLine_bgcolor_gui = '#FF5F00'
let g:indentLine_char = '┆'
set list
set listchars=tab:>-
":set list lcs=tab:\|\

"Syntastic syntax checking
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_php_checkers = ['php','phpcs','phpmd']

" If the current buffer has never been saved, it will have no name,
" call the file browser to save it, otherwise just save it.
" command -nargs=0 -bar Update if &modified 
"                            \|    if empty(bufname('%'))
"                            \|        browse confirm write
"                            \|    else
"                            \|        confirm write
"                            \|    endif
"                            \|endif

"cursor to line
if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[1 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[5 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[3 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

"omni completion with tab
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
set completeopt=longest,menuone
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

