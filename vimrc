set nocompatible                " be iMproved
filetype off                    " required!
let mapleader=","               " change the leader to be a comma vs slash
set laststatus=2                " Always show the statusline
set encoding=utf-8              " Necessary to show Unicode glyphs
set hidden                      " makes vim work like every other multiple-file editor
set title                       " show title in console title bar
set number                      " Display line numbers
set numberwidth=1               " using only 1 column (and 1 space) while possible
set wildmenu                    " Menu completion in command mode on <Tab>
set wildmode=list:longest,full                  " <Tab> cycles between all matching choices.
set ruler                       " show the cursor position all the
set backspace=indent,eol,start  " Allow backspacing over autoindent, EOL, and BOL
set autoindent                  " always set autoindenting on
set smartindent                 " use smart indent if there is no indent file
set tabstop=4                   " <tab> inserts 4 spaces
set shiftwidth=4                " but an indent level is 2 spaces wide.
set softtabstop=4           	" <BS> over an autoindent deletes both spaces.
set expandtab               	" Use spaces, not tabs, for autoindent/tab key.
set shiftround              	" rounds indent to a multiple of shiftwidth
set matchpairs+=<:>             " show matching <> (html mainly) as well
set lazyredraw                  " do not redraw while running macros (muchfaster) (LazyRedraw)
set textwidth=80                " used by gqq or <VISUAL>gq command to format lines
set clipboard=unnamedplus       " make vim use the system clipboard by default

""" Mouse settings
"
set mouse=a

""" Insert completion
" don't select first item, follow typing in autocomplete
set completeopt=menuone,longest,preview
" Keep a small completion window
set pumheight=6

""" Ignore these files when completing
"
set wildignore+=*.o,*.obj,.git,*.pyc
set wildignore+=eggs/**
set wildignore+=*.egg-info/**

""" Reading/Writing
"
set noautowrite                 " Never write a file unless I request it.
set noautowriteall              " NEVER.
set noautoread                  " Don't automatically re-read changed files.
set modeline                    " Allow vim options to be embedded in files;
set modelines=5                 " they must be within the first or last 5 lines.
set ffs=unix,dos,mac            " Try recognizing dos, unix, and mac line endings.

""" Messages, Info, Status
"
set vb t_vb=                    " Disable all bells.  I hate ringing/flashing.
set confirm                     " Y-N-C prompt if closing with unsaved changes.
set showcmd                     " Show incomplete normal mode commands as I type.

""" Searching and Patterns
"
set ignorecase                  " Default to using case insensitive searches,
set smartcase                   " unless uppercase letters are used in the regex.
set smarttab                    " Handle tabs more intelligently 
set hlsearch                    " Highlight searches by default.
set incsearch                   " Incrementally search while typing a /regex

""" Misc
"
set nobackup
set noswapfile
set foldlevel=99

if has("statusline")
    set statusline=%<%f\ %h%m%r%=%{\"[\".(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\").\"]\ \"}%k\ %-14.(%l,%c%V%)\ %P
endif

""" VUNDLE
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

" My bundles
Plugin 'scrooloose/syntastic'
Plugin 'spf13/vim-colors'
Plugin 'joonty/vdebug'
Plugin 'majutsushi/tagbar'

call vundle#end()
filetype plugin indent on     " required!
" ...
filetype on

" F3 toogles TabBar
nmap <F3> :TagbarToggle<CR>
let g:tagbar_ctags_bin='/usr/local/bin/ctags'

""" vdebug
"
let g:vdebug_options = {}
let g:vdebug_options["port"] = 9001
let g:vdebug_options["break_on_open"] = 1
let g:vdebug_options["server"] = "127.0.0.1"
let g:vdebug_options["timeout"] = 20
let g:vdebug_options["ide_key"] = "vmattos"

""" syntastic
"
let g:syntastic_enable_signs=1
let g:syntastic_auto_jump=0
let g:syntastic_stl_format = '[%E{Err: %fe #%e}%B{, }%W{Warn: %fw #%w}]'
let g:syntastic_mode_map = { 'mode': 'active',
                           \ 'active_filetypes': ['python', 'php'],
                           \ 'passive_filetypes': ['puppet'] }
let g:syntastic_python_checkers=['flake8']
let g:syntastic_python_flake8_post_args='--ignore=E501,E128,E225'

""" Colors
"
silent!colorscheme molokai
set colorcolumn=99
set t_Co=256
syntax on
set cursorline
hi ColorColumn ctermbg=red guibg=red
hi TabLineFill ctermfg=LightGray ctermbg=Black
hi TabLine ctermfg=Gray ctermbg=Black
hi TabLineSel ctermfg=White ctermbg=Red
hi CursorLine term=bold cterm=bold guibg=Grey40
hi visual ctermfg=black ctermbg=lightblue

""" Highlight excess line length
"
augroup vimrc_autocmds
    autocmd!
    " highlight characters past column 99
    autocmd FileType python highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python match Excess /\%99v.*/
    autocmd FileType python set nowrap
augroup END

" Indent/unindent highlighted block (and maintain highlight)
"
vnoremap <Tab>    >gv
vnoremap <S-Tab>  <gv

""" Include ~/.vimrc_extra, if file exists
"
let vimrc_extra=expand("~/.vimrc_extra")
if filereadable(vimrc_extra)
    exec ":source " . vimrc_extra
endif
