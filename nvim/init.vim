" ----------------------------------------------------------------------
"
" NeoVim Configuration
"
" ----------------------------------------------------------------------

" Make searching case insensitive by default. Case sensitivity can be
" enabled per search by including '\C' anywhere in the search term.
set ignorecase

" Enable line numbers.
set number

" Splits are automatically made the same size.
set equalalways

" Number of visual spaces a tab character counts for.
set tabstop=4

" Number of spaces to insert when hitting tab.
set softtabstop=4

" Insert spaces when pressing tab.
set expandtab

" Number of spaces to indent with '>>' and '<<'
set shiftwidth=4

" Display invisible characters (tabs, trailing whitespace, etc.).
set list

" ----------------------------------
" Filetype configurations
" ----------------------------------

filetype plugin on

augroup filetype_lua
  autocmd!
  autocmd FileType lua setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
augroup END

augroup filetype_markdown
  autocmd!
  autocmd FileType markdown setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2
augroup END

augroup filetype_txt
  autocmd!
  autocmd BufNewFile,BufRead *.txt setlocal ft=text
  autocmd FileType text setlocal tabstop=3|setlocal shiftwidth=3|setlocal softtabstop=3
augroup END

" ----------------------------------
" Plugins
" ----------------------------------

call plug#begin(stdpath('data') . '/plugged')

Plug 'numToStr/Comment.nvim'
Plug 'junegunn/fzf'
Plug 'karb94/neoscroll.nvim'

call plug#end()

" Comment
" ------------------

lua require('Comment').setup()
"
" Neoscroll
" ------------------

lua require('neoscroll').setup()

" FZF
" ------------------
nnoremap <C-p> :FZF<CR>
