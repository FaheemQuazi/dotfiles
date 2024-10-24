" Add plugins when we're using nvim
source ~/.config/nvim/plugins.vim

" Import vimrc (so vim still works too)
source ~/.vimrc

" Set Up Keybinds Specifically for nvim
" NERD Tree Toggle
nnoremap <silent> <leader><tab> :NERDTreeToggle<CR>
" Smart way to move between windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

