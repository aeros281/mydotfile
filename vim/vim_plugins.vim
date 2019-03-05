call plug#begin('~/.vim/plugged')

""" Common
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'w0rp/ale'

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

""" Interface
Plug 'bling/vim-airline'

""" Language vim script
Plug 'neovimhaskell/haskell-vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leafgarland/typescript-vim'

""" Completor
""" Plug 'maralla/completor.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-file.vim'
Plug 'yami-beta/asyncomplete-omni.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'prabirshrestha/asyncomplete-ultisnips.vim'
Plug 'justmao945/vim-clang'
Plug 'runoshun/tscompletejob'
Plug 'prabirshrestha/asyncomplete-tscompletejob.vim'

""" Plug 'davidhalter/jedi-vim'

""" Code display
Plug 'Yggdroot/indentLine'

""" Colorscheme
Plug 'tomasr/molokai'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'danilo-augusto/vim-afterglow'
Plug 'ericbn/vim-solarized'
Plug 'junegunn/seoul256.vim'
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" Plugin configuration "
source ~/.vim/plugconfig/haskell-vim.vim
source ~/.vim/plugconfig/vim-easymotion.vim
source ~/.vim/plugconfig/vim-airline.vim
source ~/.vim/plugconfig/vim-mucomplete.vim
source ~/.vim/plugconfig/indent-guides.vim
source ~/.vim/plugconfig/indentLine.vim 
""" source ~/.vim/plugconfig/completor.vim

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"

let g:asyncomplete_smart_completion = 1
let g:asyncomplete_auto_popup = 1

au User asyncomplete_setup call asyncomplete#register_source(asyncomplete#sources#file#get_source_options({
    \ 'name': 'file',
    \ 'whitelist': ['*'],
    \ 'priority': 10,
    \ 'completor': function('asyncomplete#sources#file#completor')
    \ }))

call asyncomplete#register_source(asyncomplete#sources#omni#get_source_options({
\ 'name': 'omni',
\ 'whitelist': ['*'],
\ 'blacklist': ['c', 'cpp', 'html'],
\ 'completor': function('asyncomplete#sources#omni#completor')
\  }))

if has('python3')
    let g:UltiSnipsExpandTrigger="<c-e>"
    call asyncomplete#register_source(asyncomplete#sources#ultisnips#get_source_options({
        \ 'name': 'ultisnips',
        \ 'whitelist': ['*'],
        \ 'completor': function('asyncomplete#sources#ultisnips#completor'),
        \ }))
endif

call asyncomplete#register_source(asyncomplete#sources#tscompletejob#get_source_options({
    \ 'name': 'tscompletejob',
    \ 'whitelist': ['typescript'],
    \ 'completor': function('asyncomplete#sources#tscompletejob#completor'),
    \ }))

if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif


" Assuming you're using `<c-u>` for snippet expansion
let g:UltiSnipsSnippetDirectories=['~/.vim/UltiSnips', 'UltiSnips']
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
