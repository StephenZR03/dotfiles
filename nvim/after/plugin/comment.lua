require('Comment').setup({
    ignore = '^$',
    toggler = {
        line = 'gcc',
        block = 'gbc',
    },
    opleader = {
        line = 'gc',
        block = 'gb',
    },
    pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

require('ts_context_commentstring').setup{
    enable_autocmd = false,
}
