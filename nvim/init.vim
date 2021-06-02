"##############################################
" Base settings
set scrolloff=10
set relativenumber
set mouse=a
set showtabline=2
set smarttab


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

  " Language Support
  Plug 'neovim/nvim-lspconfig'	" Neovim LSP configs
  Plug 'cespare/vim-toml'	" TOML syntax
  Plug 'scalameta/nvim-metals'	" Scala LSP
call plug#end()

colorscheme doom-one

" LSP Configs
lua << EOF
require'lspconfig'.rust_analyzer.setup{}
EOF
