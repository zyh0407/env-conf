set ai ts=4 sw=4
"colorscheme grb256
syntax on
set backupdir=~/.vim/backups
set directory=~/.vim/swaps
if exists("&undodir")
	set undodir=~/.vim/undo
endif
set viminfo+=! 
set relativenumber
set cursorline

if has("autocmd")
	" Enable file type detection
	filetype on
	" Treat .json files as .js
	autocmd BufNewFile,BufRead *.json setfiletype json syntax=javascript

	autocmd InsertEnter * :set number
	autocmd InsertLeave * :set relativenumber
endif


