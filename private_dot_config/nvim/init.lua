----------------------------------------------------------------------
--
-- NeoVim Configuration
--
----------------------------------------------------------------------

-- Make searching case insensitive by default. Case sensitivity can be
-- enabled per search by including '\C' anywhere in the search term.
vim.opt.ignorecase = true

-- Enable line numbers.
vim.opt.number = true

-- Number of visual spaces a tab character counts for.
vim.opt.tabstop = 4

-- Number of spaces to insert when hitting tab.
vim.opt.softtabstop = 4

-- Insert spaces when pressing tab.
vim.opt.expandtab = true

-- Number of spaces to indent with '>>' and '<<'
vim.opt.shiftwidth = 4

-- Display invisible characters (tabs, trailing whitespace, etc.).
vim.opt.list = true

vim.g.mapleader = " "

-- ----------------------------------
-- Filetype configurations
-- ----------------------------------

vim.cmd [[
  filetype plugin on
]]

local lua_augroup = vim.api.nvim_create_augroup('filetype_lua', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  group = lua_augroup,
  command = 'setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2'
})

local c_augroup = vim.api.nvim_create_augroup('filetype_c', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'c',
  group = c_augroup,
  command = 'setlocal noexpandtab|setlocal tabstop=4'
})

local go_augroup = vim.api.nvim_create_augroup('filetype_go', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  group = go_augroup,
  command = 'setlocal noexpandtab|setlocal tabstop=4'
})

local markdown_augroup = vim.api.nvim_create_augroup('filetype_markdown', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'markdown',
  group = markdown_augroup,
  command = 'setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2|setlocal textwidth=80'
})

local html_augroup = vim.api.nvim_create_augroup('filetype_html', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'html|htmldjango',
  group = html_augroup,
  command = 'setlocal tabstop=2|setlocal shiftwidth=2|setlocal softtabstop=2'
})

local txt_augroup = vim.api.nvim_create_augroup('filetype_txt', {clear = true})
vim.api.nvim_create_autocmd('FileType', {
  pattern = 'text',
  group = txt_augroup,
  command = 'setlocal tabstop=3|setlocal shiftwidth=3|setlocal softtabstop=3|setlocal tw=72'
})

-- ----------------------------------
-- Plugins
-- ----------------------------------

local Plug = vim.fn["plug#"]

vim.call("plug#begin", "~/.config/nvim/plugged")

Plug('numToStr/Comment.nvim')
Plug('junegunn/fzf')
Plug('arcticicestudio/nord-vim')
Plug('mcchrish/nnn.vim')
Plug('editorconfig/editorconfig-vim')
Plug('lukas-reineke/indent-blankline.nvim')
Plug('sheerun/vim-polyglot')

vim.call("plug#end")

-- Comment
-- ------------------

require("Comment").setup()

-- FZF
-- ------------------
vim.cmd("nnoremap <C-p> :FZF<CR>")

-- nnn
-- ------------------

require("nnn").setup({
  command = "nnn -o -C",
  set_default_mappings = 0,
  replace_netrw = 1,
})

vim.api.nvim_set_keymap("n", "<leader>o", ":NnnPicker %:p:h<CR>", {noremap=true})
vim.cmd("let g:nnn#session = 'global'")

-- indent-blankline
-- ------------------

require('indent_blankline').setup()
