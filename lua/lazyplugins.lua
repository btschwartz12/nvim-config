return {

    "github/copilot.vim",

    'neovim/nvim-lspconfig',         -- Configurations for Nvim LSP (Language Server Protocol) client
    'j-hui/fidget.nvim',             -- A plugin that provides a UI for showing LSP progress
    'onsails/lspkind-nvim',          -- Adds pictograms to LSP completions for better visual identification
    'glepnir/lspsaga.nvim',          -- A light-weight LSP plugin with a lot of UI enhancements for LSP features
    'ray-x/go.nvim',                 -- Plugin for Go development, provides LSP and additional features specific to Go
    'ray-x/guihua.lua',              -- GUI library for Neovim, used as a dependency for ray-x/go.nvim
    'hrsh7th/cmp-nvim-lsp',          -- LSP source for nvim-cmp, enabling LSP-based completions
    'hrsh7th/cmp-buffer',            -- Buffer source for nvim-cmp, enabling buffer-based completions
    'hrsh7th/nvim-cmp',              -- Main autocompletion plugin
    'saadparwaiz1/cmp_luasnip',      -- Luasnip source for nvim-cmp, enabling snippet completions using Luasnip
    'windwp/nvim-ts-autotag',        -- Automatically close and rename HTML tags
    'windwp/nvim-autopairs',         -- Automatically insert pairs of brackets, quotes, etc.
    

    "ellisonleao/gruvbox.nvim",

    {
        "nvim-tree/nvim-tree.lua",
        version = "v1.1.1",
        lazy = false,
        dependencies = {
        "nvim-tree/nvim-web-devicons",
        },
        config = function()
        require("nvim-tree").setup {
        git = {
            ignore = false,
        },
        filters = {
            dotfiles = false,
        },
        }
        end,
    },

    {
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        build = ":TSUpdate",
        config = function ()
          local configs = require('nvim-treesitter.configs')
    
          configs.setup({
              ensure_installed = {
                "tsx",
                "toml",
                "json",
                "yaml",
                "css",
                "html",
                "lua",
                "markdown",
                "markdown_inline",
                "go",
                "dockerfile",
                "bash",
                "c",
                "vim",
                "vimdoc",
                "query",
                "javascript",
              },
              sync_install = false,
              highlight = { enable = true },
              indent = { enable = true },  
              auto_install = true,
            })
        end,
      },

      {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
      },

      'nvim-telescope/telescope-file-browser.nvim',

      {
				"folke/noice.nvim",
				event = "VeryLazy",
				opts = {
					-- add any options here
				},
				dependencies = {
					-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
					"MunifTanjim/nui.nvim",
					-- OPTIONAL:
					--   `nvim-notify` is only needed, if you want to use the notification view.
					--   If not available, we use `mini` as the fallback
					"rcarriga/nvim-notify",
					}
			},

      'akinsho/nvim-bufferline.lua',

      {
        'ggandor/leap.nvim',
      },

      { 'junegunn/fzf', build = ':call fzf#install()' },

      {
        'lewis6991/gitsigns.nvim',
        tag = 'v0.6',
        config = function()
          require('gitsigns').setup()
        end,
      },

      {
        "iamcco/markdown-preview.nvim",
        build = function() vim.fn["mkdp#util#install"]() end,
      },

			'rcarriga/nvim-notify',

      {
        {'romgrk/barbar.nvim',
          dependencies = {
            'lewis6991/gitsigns.nvim', 
            'nvim-tree/nvim-web-devicons', 
          },
          init = function() vim.g.barbar_auto_setup = false end,
          opts = {
            animation = true,
            insert_at_start = true,
          },
          version = '^1.0.0', 
        },
      },
      {
					'nvim-lualine/lualine.nvim',
					dependencies = { 'nvim-tree/nvim-web-devicons' }
			},
			{
				'f-person/git-blame.nvim',
			},
			{
				"folke/which-key.nvim",
				event = "VeryLazy",
				opts = {
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
				},
				keys = {
					{
						"<leader>?",
						function()
							require("which-key").show({ global = false })
						end,
						desc = "Buffer Local Keymaps (which-key)",
					},
				},
			},
			{
				"numToStr/Comment.nvim",
				opts = {
				}
			}
}
