if has('gui_running')
	set guifont=Source\ Code\ Pro\ for\ Powerline\ Light\ 10
endif
set number
set hlsearch 
set wrap!
set formatoptions-=t
set showtabline=2
set laststatus=2
set nocompatible              " be iMproved, required
filetype on                  " required

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

cd /mnt/Workspace/xampp/htdocs/
autocmd Filetype css,php,html setlocal tabstop=8 "Set indentation size
nnoremap <esc> :noh<return><esc>
map <F2> :NERDTreeToggle<CR>
map <Leader>nt :NERDTree %:p:h<CR>
map <F3> :TagbarToggle<CR>
map <F4> :Startify<CR>
nnoremap <C-k> :TComment<CR> 
nnoremap <silent> <C-S> :<C-u>Update<CR> 
nmap <F5> :exec &nu==&rnu? "se nu!" : "se rnu!"<CR>

set guioptions -=m "hide menubar
set guioptions -=T "hide toolbar
set ignorecase "incase sensitive searching /
set smartcase " ^
set clipboard=unnamed
set clipboard=unnamedplus "Clipboard for cut copy paste
:set number relativenumber
:augroup numbertoggle
:  autocmd!
:  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
:  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
:augroup END
runtime macros/matchit.vim "block starting tags to closing
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.php' "set <html> autoclose tag in these files

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
command -nargs=0 -bar Update if &modified 
                           \|    if empty(bufname('%'))
                           \|        browse confirm write
                           \|    else
                           \|        confirm write
                           \|    endif
                           \|endif

set background=dark 
set t_Co=256
colorscheme hybrid_material
"colorscheme archery
