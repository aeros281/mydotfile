set nocompatible              " be iMproved, required
filetype off                  " required

filetype plugin indent on    " required

syntax on

" If using a dark background within the editing area and syntax highlighting
" turn on this option as well
"set background=light

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Uncomment the following to have Vim load indentation rules and plugins
" according to the detected filetype.
if has("autocmd")
  filetype plugin indent on
endif

" The following are commented out as they cause vim to behave a lot
" differently from regular Vi. They are highly recommended though.
set showcmd		" Show (partial) command in status line.
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set smartcase		" Do smart case matching
set incsearch		" Incremental search
set autowrite		" Automatically save before commands like :next and :make
set hidden		" Hide buffers when they are abandoned
set mouse=a		" Enable mouse usage (all modes)

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

"set colorscheme
let g:gruvbox_italic=1
set t_Co=256
set background=dark

" Autoindent options
set tabstop=4
set softtabstop=4
"set noexpandtab
set expandtab
set shiftwidth=4
set autoindent
set smartindent
set cindent
set number
set nocompatible
set mouse=a
set cursorline


" Gvim settings
if has('gui_running')
	set guifont=Inconsolata\ 13
endif

" Enable save as root hack
cmap w!! w !sudo tee > /dev/null %

source ~/.vim/vim_plugins.vim

function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nmap <C-P> :call FzyCommand("find -type f", ":e")<cr>
nmap ; :Buffers<CR>

nmap <Leader>a :Ag
nmap <Leader>A vaw"ay:Ag <C-R>a

nmap <Space> :

set termguicolors

" use 256 colors in terminal
set t_Co=256
"set term=screen-256color

"set t_8b=[48;2;%lu;%lu;%lum
"set t_8f=[38;2;%lu;%lu;%lum

""" Theme settings
colorscheme gruvbox
set background=dark

set t_ZH=[3m
set t_ZR=[23m

" `gf` opens file under cursor in a new vertical split
nnoremap gf :vertical wincmd f<CR>
