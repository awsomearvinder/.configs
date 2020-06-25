set nocompatible
set shell=/bin/bash
set hidden
set number relativenumber
set showcmd
set incsearch
set hlsearch
set shiftwidth=4
set tabstop=4

let mapleader = "\<Space>"
call plug#begin('~/.vim/plugged')

Plug 'gioele/vim-autoswap'
Plug 'jiangmiao/auto-pairs'
" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'airblade/vim-rooter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'voldikss/vim-floaterm'
Plug 'chriskempson/base16-vim'
Plug 'Chiel92/vim-autoformat'

call plug#end()


"COC
set cmdheight=2
set updatetime=300
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction
inoremap <silent><expr> <TAB>
			\ pumvisible() ? "\<C-n>" :
			\ <SID>check_back_space() ? "\<TAB>" :
			\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-rust-analyzer' ]

"AUTOFORMAT
au BufWrite * :Autoformat

"FZF
let $FZF_DEFAULT_COMMAND =  "rg --files"
let $FZF_DEFAULT_OPTS=' --color=dark --color=fg:15,bg:-1,hl:1,fg+:#ffffff,bg+:#343D46,hl+:1 --color=info:0,prompt:0,pointer:12,marker:4,spinner:11,header:-1 --layout=reverse  --margin=1,4'
let g:fzf_layout = { 'window': 'call FloatingFZF()' }

function! FloatingFZF()
	let buf = nvim_create_buf(v:false, v:true)
	call setbufvar(buf, '&signcolumn', 'no')

	let height = float2nr(12)
	let width = float2nr(80)
	let horizontal = float2nr((&columns - width) / 2)
	let vertical = 1

	let opts = {
				\ 'relative': 'editor',
				\ 'row': vertical,
				\ 'col': horizontal,
				\ 'width': width,
				\ 'height': height,
				\ 'style': 'minimal'
				\ }

	call nvim_open_win(buf, v:true, opts)
endfunction

"BASE16
let base16colorspace=256  " Access colors present in 256 colorspace
if filereadable(expand("~/.vimrc_background"))
	let base16colorspace=256
	source ~/.vimrc_background
endif

nnoremap <c-t> :FloatermToggle <CR>
nnoremap <silent> ; :call fzf#vim#files('.', {'options': '--prompt ""'})<CR>
nnoremap <silent> <leader>b :Buffers<CR>
noremap <c-c> <esc>
