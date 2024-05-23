vim.keymap.set("n", "<leader>ex", vim.cmd.Ex, { desc = "open netrw" }) -- open netrw
vim.keymap.set("v", "<leader>ex", vim.cmd.Ex, { desc = "open netrw" }) -- open netrw
vim.keymap.set("n", "<C-x>", "<C-v>") -- visual block mode

-- fix some weird tab behaviour (tab mapped to ctrl + z; this is important for tab autocomplete to work)
vim.keymap.set('c', '<tab>', '<C-z>', { silent = false })

-- move highlighted lines up or down
vim.keymap.set("v", "J", ":m '>+1<cr>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<cr>gv=gv")

vim.keymap.set("n", "J", "mzJ`z") -- append next line

-- half page jumping
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "half page down" })
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "half page up" })

-- keep search terms vertically centralized
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>p", "\"_dP", { desc = "no replace paste" }) -- paste over text without replacing the current buffer

-- yank to system clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "yank to system clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y", { desc = "yank to system clipboard" })

-- delete to system clipboard
vim.keymap.set("n", "<leader>d", "\"+d", { desc = "delete to system clipboard" })
vim.keymap.set("v", "<leader>d", "\"+d", { desc = "delete to system clipboard" })

vim.keymap.set("n", "Q", "<nop>") -- rebind Q so you don't do something you'll regret
vim.keymap.set("n", "<C-s>", "<cmd>silent !tmux neww tmux-sessionizer<cr>") -- tmux-sessionizer... neat

-- quick fix navigation
vim.keymap.set("n", "<leader>k", "<cmd>cnext<cr>zz", { desc = "next error" })
vim.keymap.set("n", "<leader>j", "<cmd>cprev<cr>zz", { desc = "prev error" })
vim.keymap.set("n", "<leader>K", "<cmd>lnext<cr>zz", { desc = "next loc" })
vim.keymap.set("n", "<leader>J", "<cmd>lprev<cr>zz", { desc = "prev loc" })

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "search and replace" }) -- search and replace
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "enable execution" }) -- enable execution

vim.keymap.set("n", "<leader>ccp", function ()
    local actions = require("CopilotChat.actions")
    require("CopilotChat.integrations.telescope").pick(actions.prompt_actions())
end, { desc = "copilot chat" })

vim.keymap.set("n", "<leader>ccq", function ()
    local input = vim.fn.input("quick chat: ")
    if input ~= "" then
        require("CopilotChat").ask(input, { selection = require("CopilotChat.select").buffer })
    end
end, { desc = "quick chat" })

vim.keymap.set("n", "<leader>cco", "<cmd>CopilotChatOpen<cr>", { desc = "open copilot chat" })
