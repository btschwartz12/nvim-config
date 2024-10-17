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
vim.keymap.set('t', '<C-l>', '<C-\\><C-n><C-w><C-l>', {noremap = true})
vim.keymap.set('t', '<C-k>', '<C-\\><C-n><C-w><C-k>', {noremap = true})
vim.keymap.set('t', '<C-j>', '<C-\\><C-n><C-w><C-j>', {noremap = true})
vim.keymap.set('t', '<C-h>', '<C-\\><C-n><C-w><C-h>', {noremap = true})

-- Tab navigation
vim.keymap.set({'n', 't'}, '<leader>;', '<cmd>BufferPrevious<cr>', {noremap = true})
vim.keymap.set({'n', 't'}, "<leader>'", '<cmd>BufferNext<cr>', {noremap = true})
vim.keymap.set({'n', 't'}, '<leader><', '<cmd>BufferMovePrevious<cr>', {noremap = true})
vim.keymap.set({'n', 't'}, '<leader>>', '<cmd>BufferMoveNext<cr>', {noremap = true})
vim.keymap.set('n', '<leader>x', '<cmd>BufferClose<cr>', {noremap = true})
vim.keymap.set('n', '<leader>fp', '<cmd>BufferPin<cr>', {noremap = true})

-- Terminal
vim.keymap.set('n', '<leader>t', '<cmd>set splitbelow | sp | resize 15 | startinsert | term<cr>', {noremap = true})
vim.keymap.set('n', '<leader>vt', '<cmd>vs | startinsert | term<cr>', {noremap = true})
vim.keymap.set('n', '<leader>tn', '<cmd>tabnew | startinsert | term<cr>', {noremap = true})
vim.keymap.set('t', '<leader>x', '<C-\\><C-n>', {noremap = true})

-- Misc
vim.keymap.set('n', '<leader>b', "<cmd>NvimTreeToggle<cr>", {noremap = true})
vim.keymap.set('n', '<leader>w', "<cmd>w %<cr>", {noremap = true}) 
-- vim.keymap.set('n', '<leader>,', "i,<Esc>", {noremap = true}) 
vim.keymap.set('i', '<leader>w', "<cmd>lua vim.lsp.buf.hover()<cr><cmd>lua vim.lsp.buf.hover()<cr>")

-- Telescope
vim.keymap.set("n", "<leader>p", "<cmd>FZF<cr>")
vim.keymap.set("n", "<leader>ff", ":Telescope file_browser path=%:p:h select_buffer=true<CR>")
vim.keymap.set('n', '<leader>fg', "<cmd>Telescope live_grep<cr>", {noremap = true})
vim.keymap.set('n', '<leader>fb', "<cmd>Telescope buffers<cr>", {noremap = true})
vim.keymap.set('n', '<leader>fh', "<cmd>Telescope help_tags<cr>", {noremap = true})
vim.keymap.set('n', '<leader>gb', "<cmd>Telescope git_branches<cr>", {noremap = true})

vim.opt.list = true
vim.opt.listchars = { tab = '>-', trail = '·', extends = '>', precedes = '<', space = '·' }

vim.cmd.colorscheme("gruvbox")

vim.diagnostic.config({
  virtual_text = false
})
vim.o.updatetime = 250
vim.cmd("autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})")

vim.opt.clipboard = ""

require('lualine').setup {
	options = {
		theme = 'gruvbox'
	}
}

require('leap').create_default_mappings()

require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

vim.o.completeopt = "menuone,noselect"

-- Set up nvim-cmp
local cmp = require('cmp')

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
   	{ name = 'luasnip' }, 
		{ name = 'buffer' },
    { name = 'path' },
  })
})

local luasnip = require('luasnip')

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- ... rest of your cmp configuration
})

local luasnip = require('luasnip')

-- Load snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  -- ... rest of your cmp configuration
})

-- Set up lspconfig for Golang
local capabilities = require('cmp_nvim_lsp').default_capabilities()

require('lspconfig').gopls.setup{
  capabilities = capabilities,
}
