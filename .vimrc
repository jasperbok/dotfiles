" -----------------------------------------------------------------------------
" 
" Vim configuration file
"
" -----------------------------------------------------------------------------

" --------------------------------------------------
" Global Vim settings
" --------------------------------------------------

" Turn backups off.
set nobackup
set nowritebackup
set noswapfile

" Remove the delay after pressing <esc> in insert
" mode. A side effect of this is that the arrow keys
" cannot be used in insert mode.
set noesckeys

" Make backspace behave normally.
set backspace=indent,eol,start

" Encode all files as UTF-8 by default.
set encoding=utf-8

" Make searching case insensitive.
set ignorecase

" --------------------------------------------------
" Interface
" --------------------------------------------------

" Enable line numbers.
set number

" Show the current line and column in the status.
set ruler

" Make sure the status line is always visible.
set laststatus=2

" Enable syntax highlighting.
syntax enable

" Splits are automatically made the same size.
set equalalways

" --------------------------------------------------
" Tabs, spaces, and indentation
" --------------------------------------------------

" Number of visual spaces a tab counts for.
set tabstop=4

" Number of spaces to insert when hitting tab.
set softtabstop=4

" Inserted spaces when pressing <TAB>.
set expandtab
"
" Number of spaces to indent with '>>' and '<<'
set shiftwidth=4

" When starting a new line, copy the indent of the current line.
set autoindent

" --------------------------------------------------
" FZF Extensions
" --------------------------------------------------

set rtp+=/usr/local/opt/fzf
nnoremap <C-p> :FZF<CR>

" --------------------------------------------------
" Autocommands
" --------------------------------------------------

filetype plugin on

augroup filetype_c
  autocmd!
  autocmd FileType c setlocal tabstop=4|setlocal shiftwidth=4|setlocal noexpandtab
augroup END

augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
augroup END

augroup filetype_twig
  autocmd!
  autocmd FileType twig setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2|setlocal syntax=html
augroup END

augroup filetype_python
  autocmd!
  autocmd BufNewFile,BufRead *.py setlocal ft=python
  autocmd FileType python setlocal fileformat=unix
  autocmd FileType python :iabbrev <buffer> utf8 # encoding: utf-8
  autocmd FileType python :iabbrev <buffer> ucode from __future__ import unicode_literals
augroup END

augroup filetype_go
  autocmd!
  autocmd BufNewFile,BufRead *.go setlocal ft=go
  autocmd FileType go setlocal fileformat=unix
  autocmd FileType go setlocal encoding=utf-8
  autocmd FileType go setlocal tabstop=4|setlocal shiftwidth=4|setlocal noexpandtab
augroup END

augroup markdown
  autocmd!
  autocmd FileType markdown setlocal tabstop=2|setlocal shiftwidth=2|setlocal expandtab|setlocal tw=72|setlocal softtabstop=2
augroup END

augroup text
  autocmd!
  autocmd BufNewFile,BufRead *.txt setlocal ft=text
  autocmd FileType text setlocal tabstop=3|setlocal shiftwidth=3|setlocal softtabstop=3|setlocal textwidth=72
augroup END

augroup misc
  autocmd!
  autocmd FileType html setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
  autocmd FileType htmldjango setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
  autocmd BufNewFile,BufRead *.tpl setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
  autocmd FileType css setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
  autocmd FileType javascript setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
  autocmd FileType vim setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
augroup END

" --------------------------------------------------
" Mappings
" --------------------------------------------------

" Shortcuts for editing and reloading .vimrc.
nnoremap <leader>ev :split $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
