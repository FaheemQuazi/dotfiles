" Bootstrap Plugins if they weren't installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugUpdate --sync | source $MYVIMRC
endif

" Plugin Directory
call plug#begin()
    Plug 'vim-airline/vim-airline' 
    Plug 'vim-airline/vim-airline-themes'
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'akinsho/toggleterm.nvim', {'tag': '*'}
"    Plug 'lewis6991/gitsigns.nvim'
    Plug 'rust-lang/rust.vim'
    Plug 'dense-analysis/ale'
    Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'puremourning/vimspector'
    Plug 'stevearc/overseer.nvim'
call plug#end()

" airline config
let g:airline_powerline_fonts = 1
let g:airline_theme = 'angr'

" vim-devicons setup
set encoding=UTF-8

" toggleterm setup
lua << EOF
    require("toggleterm").setup{ 
        open_mapping = [[<leader>t]] ,
        direction = 'float' 
    }
EOF
set hidden

" gitsigns setup
"lua << EOF
"    require('gitsigns').setup()
"EOF

" Ale Configuration
let g:airline#extensions#ale#enabled = 1
let g:ale_virtualtext_delay = 3
set omnifunc=ale#completion#OmniFunc

" Deoplete Configuration
let g:deoplete#enable_at_startup = 1

" overseer Configuration
lua << EOF
    require('overseer').setup({
        strategy = "toggleterm"
    })
EOF

" vimspector configuration
let g:vimspector_install_gadgets = [ 'debugpy', 'vscode-cpptools', 'CodeLLDB' ]
