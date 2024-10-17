return {
    "ellisonleao/gruvbox.nvim",
    "github/copilot.vim",
    { 'junegunn/fzf', build = ':call fzf#install()' },
    {
            'nvim-lualine/lualine.nvim',
            dependencies = { 'nvim-tree/nvim-web-devicons' }
    },
}