call plug#begin('~/.vim/plugged')

""" Common
Plug 'tpope/vim-surround'
Plug 'easymotion/vim-easymotion'
Plug 'kien/ctrlp.vim'
Plug 'w0rp/ale'

""" Interface
Plug 'bling/vim-airline'

""" Language vim script
Plug 'neovimhaskell/haskell-vim'
Plug 'editorconfig/editorconfig-vim'

""" Completor
"Plug 'lifepillar/vim-mucomplete'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

""" Code display
Plug 'nathanaelkane/vim-indent-guides'

""" Colorscheme
Plug 'tomasr/molokai'
Plug 'lifepillar/vim-solarized8'
Plug 'rakr/vim-one'
Plug 'danilo-augusto/vim-afterglow'
Plug 'ericbn/vim-solarized'

" Initialize plugin system
call plug#end()

" Plugin configuration "
source ~/.vim/plugconfig/haskell-vim.vim
source ~/.vim/plugconfig/vim-easymotion.vim
source ~/.vim/plugconfig/vim-airline.vim
source ~/.vim/plugconfig/vim-mucomplete.vim
source ~/.vim/plugconfig/ctrlp.vim
source ~/.vim/plugconfig/indent-guides.vim
source ~/.vim/plugconfig/coc-vim.vim
