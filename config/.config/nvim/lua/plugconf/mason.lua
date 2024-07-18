-- MASON
local lsp_zero = require('lsp-zero')
require("mason").setup()
require('mason-lspconfig').setup({
-- Replace the language servers listed here 
-- with the ones you want to install
  ensure_installed = {'pyright', 'lua_ls', 'marksman', 'biome', 'bashls', 'cssls', 'powershell_es', 'sqlls', 'dockerls', 'rnix', 'html'},
  handlers = {
    lsp_zero.default_setup,
  },
})
