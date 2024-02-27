local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()

-- for some reason i cant import these in keybinds
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    -- `Enter` key to confirm completion
    ['<CR>'] = cmp.mapping.confirm({select = false}),

    -- Ctrl+a to trigger completion menu
    ['<C-a>'] = cmp.mapping.complete(),

    -- Navigate between snippet placeholder
    ['<C-v>'] = cmp_action.luasnip_jump_forward(),
    ['<C-b>'] = cmp_action.luasnip_jump_backward(),

    -- Scroll up and down in the completion documentation
    ['<C-x>'] = cmp.mapping.scroll_docs(-4),
    ['<C-z>'] = cmp.mapping.scroll_docs(4),
  })
})
