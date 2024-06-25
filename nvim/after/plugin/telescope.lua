local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "find files" }) -- find files
vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = "git files" })  -- find files that are inside a git repo
vim.keymap.set('n', '<leader>fw', function()                                  -- find words
    builtin.grep_string({ search = vim.fn.input("Grep > ") })
end, { desc = "find word" })
