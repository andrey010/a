" All system-wide defaults are set in $VIMRUNTIME/debian.vim and sourced by
" the call to :runtime you can find below.  If you wish to change any of those
" settings, you should do it in this file (/etc/vim/vimrc), since debian.vim
" will be overwritten everytime an upgrade of the vim packages is performed.
" It is recommended to make changes after sourcing debian.vim since it alters
" the value of the 'compatible' option.

" This line should not be removed as it ensures that various options are
" properly set to work with the Vim-related packages available in Debian.
runtime! debian.vim

" Vim will load $VIMRUNTIME/defaults.vim if the user does not have a vimrc.
" This happens after /etc/vim/vimrc(.local) are loaded, so it will override
" any settings in these files.
" If you don't want that to happen, uncomment the below line to prevent
" defaults.vim from being loaded.
" let g:skip_defaults_vim = 1

" Uncomment the next line to make Vim more Vi-compatible
" NOTE: debian.vim sets 'nocompatible'.  Setting 'compatible' changes numerous
" options, so any other options should be set AFTER setting 'compatible'.
"set compatible

" Vim5 and later versions support syntax highlighting. Uncommenting the next
" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=dark

" Uncomment the following to have Vim jump to the last position when
" reopening a file
"if has("autocmd")
"  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
"endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
"if has("autocmd")
"  filetype plugin indent on
"endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
"set showcmd    " Show (partial) command in status line.
"set showmatch    " Show matching brackets.
"set ignorecase    " Do case insensitive matching
"set smartcase    " Do smart case matching
"set incsearch    " Incremental search
"set autowrite    " Automatically save before commands like :next and :make
"set hidden    " Hide buffers when they are abandoned
"set mouse=a    " Enable mouse usage (all modes)
call plug#begin('~/.vim/plugged')
        Plug 'drewtempelmeyer/palenight.vim'
        Plug 'vim-airline/vim-airline'
        Plug 'vim-airline/vim-airline-themes'
        Plug 'preservim/nerdtree'
        Plug 'ryanoasis/vim-devicons'
        Plug 'prettier/vim-prettier', {	  
          \ 'branch': 'release/1.x',
          \ 'for': [
          \ 'javascript',
          \ 'typescript',
          \ 'css',	    
          \ 'scss',
          \ 'json',	    
          \ 'markdown',	    
          \ 'html',
          \ 'swift' ] }
        Plug 'sheerun/vim-polyglot' "Syntax highlighting for different languages
        Plug 'neoclide/coc.nvim' , { 'branch' : 'release' }
        Plug 'pangloss/vim-javascript'    " JavaScript support
        Plug 'Quramy/tsuquyomi' " typescript
        Plug 'maxmellon/vim-jsx-pretty'
        Plug 'alvan/vim-closetag' " Automatic tag closing
        Plug 'mattn/emmet-vim'
        Plug 'tomtom/tcomment_vim' " Fast comment current line or block
        Plug 'Yggdroot/indentLine' " Hightlighting for indents
        Plug 'tmhedberg/SimpylFold' " Simple folding blocks of code
        Plug 'SirVer/ultisnips' " Snippets
        Plug 'honza/vim-snippets'
call plug#end()

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:material_style='palenight'
set background=dark
colorscheme palenight
set termguicolors 
set number

hi Normal guibg=NONE ctermbg=NONE

"For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
"Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
" < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
if (has("termguicolors"))
  set termguicolors
endif

let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#tabline#enabled = 1 " top pane
let g:airline_theme='palenight'

autocmd VimEnter * NERDTree
let g:WebDevIconsOS = 'Darwin'
let g:webdevicons_enable = 1
let g:webdevicons_enable_nerdtree = 1
let g:webdevicons_enable_airline_tabline = 1

let g:prettier#autoformat = 1
let g:prettier#exec_cmd_async = 1
let g:prettier#config#parser = 'babylon'

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

let g:coc_disable_startup_warning = 1
let g:coc_global_extensions = [ 'coc-tsserver' ]

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }


