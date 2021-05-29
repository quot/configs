###############################################
# Base settings
set scrolloff=10
set relativenumber
set mouse=a

# Split movement
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

###############################################
# Plugins and plugin settings
call plug#begin(stdpath('data') . '/plugged')
Plug 'romgrk/doom-one.vim'
Plug 'cespare/vim-toml'
Plug 'neovim/nvim-lspconfig'
call plug#end()

colorscheme doom-one

# LSP Configs
lua << EOF
require'lspconfig'.rust_analyzer.setup{}
EOF
