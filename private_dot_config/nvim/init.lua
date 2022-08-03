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

-- Splits are automatically made the same size.
vim.opt.equalalways = true

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
Plug('neovim/nvim-lspconfig')
Plug('arcticicestudio/nord-vim')

vim.call("plug#end")

-- Comment
-- ------------------

require("Comment").setup()

-- FZF
-- ------------------
vim.cmd("nnoremap <C-p> :FZF<CR>")

-- Pyright
-- ------------------

require "lspconfig".pyright.setup{}

-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.api.nvim_set_keymap('n', '<space>e', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
vim.api.nvim_set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
vim.api.nvim_set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
vim.api.nvim_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {'pyright', 'gopls'}
for _, lsp in pairs(servers) do
  require('lspconfig')[lsp].setup {
    on_attach = on_attach,
    flags = {
      -- This will be the default in neovim 0.7+
      debounce_text_changes = 150,
    }
  }
end
