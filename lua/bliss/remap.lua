vim.g.mapleader = " "
vim.keymap.set('n', '<leader>b', "<cmd>NvimTreeToggle<cr>", {noremap = true})
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]], {noremap = true})
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set('n', '<leader>w', "<cmd>w %<cr>", {noremap = true})
