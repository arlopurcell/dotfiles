" URL: http://vim.wikia.com/wiki/Example_vimrc
" Authors: http://vim.wikia.com/wiki/Vim_on_Freenode
" Description: A minimal, but feature rich, example .vimrc. If you are a
"              newbie, basing your first .vimrc on this file is a good choice.
"              If you're a more advanced user, building your own .vimrc based
"              on this file is still a good idea.
set shell=zsh
"------------------------------------------------------------
" Features {{{1
"
" These options and commands enable some very useful features in Vim, that
" no user should have to live without.

" Set 'nocompatible' to ward off unexpected things that your distro might
" have made, as well as sanely reset options when re-sourcing .vimrc
set nocompatible
filetype off

" Use the sequence "jk" as ESC in insert mode. This means you don't have to
" move from the home row to get back to normal mode.
inoremap jk <ESC>
let mapleader = "\<Space>"

call plug#begin('~/.vim/plugged')

Plug 'ervandew/supertab'
Plug 'Raimondi/delimitMate'
" Plug 'Yggdroot/indentLine'
Plug 'nathanaelkane/vim-indent-guides'
" Plug 'vim-syntastic/syntastic'
Plug 'altercation/vim-colors-solarized'
" Plug 'rust-lang/rust.vim'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'wincent/command-t'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'sudar/vim-arduino-syntax'
Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

call plug#end()


" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Attempt to determine the type of a file based on its name and possibly its
" contents. Use this to allow intelligent auto-indenting for each filetype,
" and for plugins that are filetype specific.
filetype indent plugin on

" Enable syntax highlighting
syntax on


"------------------------------------------------------------
" Must have options {{{1
"

" Better command-line completion
set wildmenu

" Show partial commands in the last line of the screen
set showcmd

" Highlight searches (use <C-L> to temporarily turn off highlighting; see the
" mapping of <C-L> below)
set hlsearch

" Modelines have historically been a source of security vulnerabilities. As
" such, it may be a good idea to disable them and use the securemodelines
" script, <http://www.vim.org/scripts/script.php?script_id=1876>.
" set nomodeline


"------------------------------------------------------------
" Usability options {{{1
"
" These are options that users frequently set in their .vimrc. Some of them
" change Vim's behaviour in ways which deviate from the true Vi way, but
" which are considered to add usability. Which, if any, of these options to
" use is very much a personal preference, but they are harmless.

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent

" Stop certain movements from always going to the first character of a line.
" While this behaviour deviates from that of Vi, it does what most users
" coming from other editors would expect.
set nostartofline

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Quickly time out on keycodes, but never time out on mappings
set notimeout ttimeout ttimeoutlen=200

" Use <F11> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F11>


"------------------------------------------------------------
" Indentation options {{{1
"
" Indentation settings according to personal preference.

" Indentation settings for using 4 spaces instead of tabs.
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" two characters wide.
"set shiftwidth=2
"set tabstop=2


"------------------------------------------------------------
" Mappings {{{1
"
" Useful mappings

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$

" Map <C-L> (redraw screen) to also turn off search highlighting until the
" next search
nnoremap <C-L> :nohl<CR><C-L>


"-----------------------------------------------------------

set background=dark
colorscheme solarized

set clipboard=unnamed

" Put all backup, swap, and undo files in the same place
set backup
set swapfile
set undofile
set backupdir=~/.vim/backup//
set directory=~/.vim/swap//
set undodir=~/.vim/undo//


"------------------------------------------
" File type specific settings
"------------------------------------------

" Less indentation in html
autocmd BufNewFile,BufRead *.html setlocal sw=2 sts=2 ts=2



"------------------------------------------
" Indent Guides Setttings
"------------------------------------------
let g:indent_guides_enable_on_vim_startup = 1

let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  ctermbg=8
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

hi IndentGuidesOdd  ctermbg=8
hi IndentGuidesEven ctermbg=8

let g:indent_guides_guide_size = 1

"------------------------------------------
" netrw settings
"------------------------------------------
" nnoremap <leader>w :Vexplore<CR>
" nnoremap <leader>d <C-w><C-w>
" 
" " Tree style list display
" let g:netrw_liststyle = 3
" 
" " Remove directory banner
" let g:netrw_banner = 0
" 
" " Open files in other window by default
" "let g:netrw_browse_split = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" 
" " Window size: 25%
" let g:netrw_winsize = 25
" let g:netrw_list_hide = '^\.,\.pyc$,\.egg-info/$'
"

set wildignore+=*/mode_modules/*,*/__pycache__/*,*/target/*,*.pyc

nnoremap <leader>d :NERDTreeFocusToggle<CR>
let NERDTreeIgnore=['\.pyc$', '.egg-info[[dir]]', '__pycache__[[dir]]']
let NERDTreeWinSize=60

nnoremap <leader>a :Files<CR>
nnoremap <leader>t :GFiles<CR>
nnoremap <leader>r :Rg<CR>

"------------------------------------------
" language client settings
"------------------------------------------
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ }

let g:LanguageClient_rootMarkers = ['.langserver.root']

nnoremap <leader>l :call LanguageClient_contextMenu()<CR>
" Or map each action separately
"nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
"nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
"nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

"------------------------------------------
" ncm2 code completion settings
"------------------------------------------
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()

" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=noinsert,menuone,noselect
