local opts = { noremap=true, silent=true }
local function set_keymap(...) vim.api.nvim_set_keymap(...) end
local function set_option(...) vim.api.nvim_set_option(...) end
set_keymap('n', 'ee', '<cmd>lua vim.diagnostic.open_float()<CR>', opts)
set_keymap('n', '[d', '<cmd>lua vim.diagnostic.goto_prev()<CR>', opts)
set_keymap('n', ']d', '<cmd>lua vim.diagnostic.goto_next()<CR>', opts)
set_keymap('n', '<space>q', '<cmd>lua vim.diagnostic.set_loclist()<CR>', opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local custom_attach = function(client, bufnr)
  print("LSP started.");
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  -- Enable completion triggered by <c-x><c-o>
  --buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', '<space>', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<space>s', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>r', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
end

local lsp = require'lspconfig'

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp.bashls.setup{on_attach=custom_attach, capabilities = capabilities}
lsp.ccls.setup{on_attach=custom_attach, capabilities = capabilities}
lsp.clangd.setup{
  on_attach=custom_attach,
  capabilities = capabilities,
  cmd = {
    "clangd",
    "--background-index",
    "--query-driver=/home/seb/toolchains/**/bin/arm-none-eabi-*"
  }
}
--lsp.sumneko_lua.setup{on_attach=custom_attach, capabilities = capabilities}
lsp.cmake.setup{on_attach=custom_attach, capabilities = capabilities}

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
  vim.lsp.diagnostic.on_publish_diagnostics, {
    underline = false,
    virtual_text = false,
    update_in_insert = false,
  }
)

require('lspfuzzy').setup {}
