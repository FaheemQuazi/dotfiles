" Bootstrap Plugins if they weren't installed
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
    silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugin Directory
call plug#begin()
    Plug 'preservim/nerdtree'
    Plug 'ryanoasis/vim-devicons'
call plug#end()

" vim-devicons setup
set encoding=UTF-8
