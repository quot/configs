"##############################################
" Base settings
set scrolloff=10
set number
set relativenumber
set mouse=a
set showtabline=2
set smarttab
set hidden "Allows switching away from a buffer before saving
let mapleader = "\<Space>"

" Split movement
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

"##############################################
" Plugins and plugin settings
call plug#begin(stdpath('data') . '/plugged')
  " Misc
  Plug 'romgrk/doom-one.vim'	" Doom ColorScheme

  " File Trees
  " Nvim-Tree
    " Plug 'kyazdani42/nvim-web-devicons' " for file icons
    " Plug 'kyazdani42/nvim-tree.lua'
  " CHADTree
    Plug 'ms-jpq/chadtree', {'branch': 'chad', 'do': 'python3 -m chadtree deps'} " File Tree

  " Telescope search
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'

  " Language Support
  Plug 'neovim/nvim-lspconfig'	" Neovim LSP configs
  Plug 'cespare/vim-toml'	" TOML syntax
  Plug 'scalameta/nvim-metals'	" Scala LSP
call plug#end()

" Misc
colorscheme doom-one

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ChadTree
let g:chadtree_settings = {
	\ 'theme.icon_glyph_set': 'devicons',
	\ 'theme.text_colour_set': 'nerdtree_syntax_dark'
	\ }

" LSP
lua << EOF
  require'lspconfig'.rust_analyzer.setup{}
EOF
