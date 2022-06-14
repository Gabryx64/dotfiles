set tabstop=2
set softtabstop=2
set shiftwidth=2
set noexpandtab
set number
colorscheme peachpuff

set nocompatible
filetype off

filetype plugin indent on

call plug#begin("~/.vim/plugged")

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sheerun/vim-polyglot'
Plug 'morhetz/gruvbox'

call plug#end()

if (empty($TMUX))
	if (has("nvim"))
		let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
	endif

	if (has("termguicolors"))
		set termguicolors
	endif
endif

set background=dark
autocmd vimenter * ++nested colorscheme gruvbox

command Ide :NERDTree | :wincmd l | :split | :resize 45 | :wincmd j | :terminal

