local lsp = require('lsp-zero')

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
end)

require('mason').setup({})
require('mason-lspconfig').setup({
    ensure_installed = { 'tsserver', 'rust_analyzer' },
    handlers = {
        function(server_name)
            require('lspconfig')[server_name].setup({})
        end,
        lua_ls = function()
            local lua_opts = lsp.nvim_lua_ls()
            require('lspconfig').lua_ls.setup(lua_opts)
        end
    },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
cmp.setup({
    sources = {
        -- { name = 'copilot' },
        { name = 'path' },
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
        { name = 'buffer ' },
    },
    mapping = {
        ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
        ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            else
                fallback()
            end
        end, { "s", "i", }),
        ['<C-Space>'] = cmp.mapping.complete(),
    },
})

local copilot = require('copilot')
copilot.setup({
    suggestion = { enabled = false },
    panel = { enabled = false },
})

require("CopilotChat").setup {
    debug = true,
    window = {
        layout = 'float',
        relative = 'cursor',
        width = 1,
        height = 0.4,
        row = 1
    }
}

lsp.set_preferences({
    sign_icons = {}
})

lsp.on_attach(function(client, bufnr)

    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set('n', 'gd', function() vim.lsp.buf.definition() end, { buffer = bufnr, remap = false, desc = "go to definition" })
    vim.keymap.set('n', '<leader>vws', function() vim.lsp.buf.workspace_symbol() end, { buffer = bufnr, remap = false, desc = "view workspace symbol" })
    vim.keymap.set('n', '<leader>vd', function() vim.diagnostic.open_float() end, { buffer = bufnr, remap = false, desc = " view diagnostics" })
    vim.keymap.set('n', '[d', function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set('n', ']d', function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set('n', '<leader>vca', function() vim.lsp.buf.code_action() end, { buffer = bufnr, remap = false, desc = "view code actions" })
    vim.keymap.set('n', '<leader>vrr', function() vim.lsp.buf.references() end, { buffer = bufnr, remap = false, desc = "view references" })
    vim.keymap.set('n', '<leader>vrn', function() vim.lsp.buf.rename() end, { buffer = bufnr, remap = false, desc = "mass rename" })
    vim.keymap.set('i', '<C-h>', function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set('n', '<leader>fo', function() vim.lsp.buf.format() end, { buffer = bufnr, remap = false, desc = "format code" })
end)

require('lspconfig').lua_ls.setup({
    settings = {
        Lua = {
            completion = {
                callSnippet = 'Replace',
            }
        }
    }
})
lsp.setup()
