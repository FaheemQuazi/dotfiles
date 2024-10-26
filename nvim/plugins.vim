" Bootstrap Plugins if they weren't installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugUpdate --sync | source $MYVIMRC
endif

" Plugin Directory
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'akinsho/toggleterm.nvim', {'tag': '*'}
    Plug 'lewis6991/gitsigns.nvim'
call plug#end()

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
lua << EOF
    require('gitsigns').setup{ 
        current_line_blame = true,
        current_line_blame_opts = {
            virt_text_pos = 'right_align',
            delay = 500
        }
    }
EOF

