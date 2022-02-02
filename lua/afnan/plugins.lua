local packer = require("packer")
local utils = require("packer.util")
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
end

vim.cmd([[packadd packer.nvim]])

packer.init({
	git = { clone_timeout = 350 },
	display = {
		title = "Packer",
		done_sym = "",
		error_syn = "×",
		keybindings = { toggle_info = "o" },
	},
})

return packer.startup({
	function()
		--  Loaded First
		use({ "lewis6991/impatient.nvim" })
		use({ "wbthomason/packer.nvim" })
		use({
			"folke/tokyonight.nvim",
			config = function()
				vim.g = {
					tokyonight_style = "storm",
					tokyonight_italic_keywords = true,
					tokyonight_italic_functions = true,
					tokyonight_italic_variables = true,
				}
				vim.o.pumblend = 20
			end,
		})
		use({ "NTBBloodbath/galaxyline.nvim", config = "require('afnan.statusline')" })
		use({ "akinsho/bufferline.nvim", config = "require('afnan.tabline')" })
		use({
			"glepnir/dashboard-nvim",
			config = function()
				require("afnan.dashboard")
			end,
		})
		use({ "folke/which-key.nvim" })
		use({ "kyazdani42/nvim-tree.lua", config = "require('afnan.nvimtree')" })

		--  Icon Packs
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("afnan.icons")
			end,
		})

		--  UI
		use({
			"rcarriga/nvim-notify",
			config = "require('afnan.notifications')",
			requires = { "nvim-telescope/telescope.nvim" },
		})
		use({ "akinsho/toggleterm.nvim", config = "require('afnan.toggleterm')", keys = "<A-t>" })
		use({
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = function()
				require("colorizer").setup()
			end,
		})
		use({
			"karb94/neoscroll.nvim",
			config = function()
				require("neoscroll").setup()
			end,
		})

		--  Telescope & Its Extentions
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = "require('afnan.telescope')",
		})

		-- Tree-Sitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = "require('afnan.treesitter')",
		})
		use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
		use({ "p00f/nvim-ts-rainbow" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter", "Comment.nvim" } })
		use({
			"windwp/nvim-autopairs",
			config = "require('afnan.autopairs')",
			after = "nvim-cmp",
		})

		--  Quick Tasking
		use({ "tpope/vim-repeat", keys = "." })
		use({
			"numToStr/Comment.nvim",
			keys = { "gcc", "gc", "gb", "gbc" },
			config = "require('afnan.comments')",
		})
		use({ "mg979/vim-visual-multi", keys = "<C-n>" })
		use({ "tpope/vim-surround", event = "InsertEnter", lock = true })
		use({ "abecodes/tabout.nvim", event = "InsertEnter" })

		--  Git
		use({ "lewis6991/gitsigns.nvim", config = "require('afnan.gitsigns')", event = "BufWinEnter" })
		use({ "TimUntersberger/neogit", event = "BufWinEnter" })
		use({ "sindrets/diffview.nvim", event = "BufWinEnter" })
		use({
			"pwntester/octo.nvim",
			config = function()
				require("octo").setup()
			end,
			event = "BufWinEnter",
			cmd = "Octo",
		})
		use({
			"rlch/github-notifications.nvim",
			config = function()
				require("afnan.github-notification")
			end,
			event = "BufWinEnter",
		})

		--  Language Server Protocol
		use({ "neovim/nvim-lspconfig", config = { "require('afnan.lsp')" }, event = "BufWinEnter" })
		use({ "ray-x/lsp_signature.nvim", config = "require('afnan.lsp.signature')", after = "nvim-lspconfig" })
		use({ "kosayoda/nvim-lightbulb", after = "nvim-lspconfig" })
		use({ "tami5/lspsaga.nvim", after = "nvim-lspconfig", config = "require('afnan.lsp.saga')" })
		use({ "jose-elias-alvarez/null-ls.nvim", config = "require('afnan.lsp.null_ls')" })
		use({ "b0o/SchemaStore.nvim", ft = { "json", "yaml", "yml" } })
		use({ "folke/lua-dev.nvim", ft = "lua" })
		use({
			"wiliamks/nice-reference.nvim",
			requires = {
				"rmagatti/goto-preview",
				config = "require('goto-preview').setup({})",
			},
		})

		-- Snippets
		use({ "L3MON4D3/LuaSnip", event = "InsertEnter", config = [[require("afnan.luasnips")]] })
		use({ "rafamadriz/friendly-snippets" })
		use({ "xmasdsamx/abusaidm.html-snippets-0.0.18", after = "LuaSnip" })
		use({ "saadparwaiz1/cmp_luasnip", after = "LuaSnip" })

		--  CMP
		use({
			"hrsh7th/nvim-cmp",
			config = "require('afnan.cmp')",
		})
		use({ "hrsh7th/cmp-nvim-lua", ft = "lua" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp", event = "InsertEnter" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp", event = "InsertEnter" })
		use({ "hrsh7th/cmp-nvim-lsp", event = "BufWinEnter" })
		use({ "hrsh7th/cmp-cmdline", event = "CmdlineEnter" })

		--  Others
		use({
			"vuki656/package-info.nvim",
			requires = { "MunifTanjim/nui.nvim", ft = "json" },
			ft = "json",
			config = "require('afnan.packageinfo')",
		})

		use({ "rafcamlet/nvim-luapad", ft = "lua" })

		--  Bootstraping Packer.nvim
		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return utils.float({ border = "double" })
			end,
		},
		profile = { enable = true, threshold = 1 },
	},
})
