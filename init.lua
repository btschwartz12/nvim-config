local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("base")
require("lazy").setup('lazyplugins', {
  lazy = true,  
})

require('lsp')

-- Swap windows
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', {noremap = true})
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', {noremap = true})
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', {noremap = true})
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', {noremap = true})

-- Swap windows in terminal
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>')
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>')
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>')
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>')

-- Tab navigation
vim.keymap.set('t', '<C-a>h', '<cmd>tabprev<cr>')
vim.keymap.set('t', '<C-a>l', '<cmd>tabnext<cr>')

-- Terminal
vim.keymap.set('n', '<leader>t', '<cmd>set splitbelow | sp | resize 15 | startinsert | term<cr>')
vim.keymap.set('n', '<leader>vt', '<cmd>vs | startinsert | term<cr>')
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew | startinsert | term<cr>')
vim.keymap.set('t', '<leader>x', '<C-\\><C-n>')

-- Misc
vim.keymap.set('n', '<leader>b', "<cmd>NvimTreeToggle<cr>", {noremap = true})
vim.keymap.set('n', '<leader>w', "<cmd>w %<cr>", {noremap = true}) 
vim.keymap.set('n', '<leader>,', "i,<Esc>", {noremap = true}) 
vim.keymap.set('i', '<leader>w', "<cmd>lua vim.lsp.buf.hover()<cr><cmd>lua vim.lsp.buf.hover()<cr>")

-- Telescope
vim.keymap.set("n", "<leader>p", "<cmd>FZF<cr>")
vim.keymap.set("n", "<leader>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {noremap = true})
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {noremap = true})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", {noremap = true})
vim.keymap.set('n', '<leader>gb', "<cmd>Telescope git_branches<cr>", {noremap = true})

-- Spectre
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {noremap = true})
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {noremap = true})
vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {noremap = true})

vim.cmd.colorscheme("gruvbox")

vim.diagnostic.config({
  virtual_text = false
})
vim.o.updatetime = 250
vim.cmd("autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})")


