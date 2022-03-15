local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	print("Installing packer.nvim")
	fn.delete(fn.stdpath("config") .. "/lua/packer_compiled.lua")
	packer_bootstrap = fn.system({
		"git",
		"clone",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	vim.cmd([[packadd packer.nvim]])
end

local packer = require("packer")
local utils = require("packer.util")

local border = { " ", " ", " ", " ", " ", " ", " ", " " }

packer.init({
	profile = { enable = true, threshold = 1 },
	max_jobs = 10,
	git = {
		clone_timeout = 350,
		subcommands = {
			fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
			install = "clone --depth %i --progress",
		},
	},
	compile_path = vim.fn.stdpath("config") .. "/lua/afnan/packer_compiled.lua",
	display = {
		title = "Packer",
		done_sym = "",
		error_syn = "×",
		keybindings = { toggle_info = "o" },
		open_fn = function()
			return utils.float({ border = border })
		end,
	},
})

return packer.startup({
	function(use)
		use({ "lewis6991/impatient.nvim" })
		use({ "nathom/filetype.nvim", config = "require('afnan.filetype')" })
		use({ "wbthomason/packer.nvim" })
		use({ "tweekmonster/startuptime.vim", cmd = "StartupTime", lock = true })
		use({
			"folke/tokyonight.nvim",
			config = function()
				vim.g = {
					tokyonight_style = "storm",
					tokyonight_italic_keywords = true,
					tokyonight_italic_functions = true,
					tokyonight_italic_variables = true,
				}
			end,
		})
		use({ "NTBBloodbath/galaxyline.nvim", config = "require('afnan.statusline')" })
		use({ "akinsho/bufferline.nvim", config = "require('afnan.tabline')" })
		use({ "folke/which-key.nvim" })
		use({ "kyazdani42/nvim-tree.lua", config = "require('afnan.nvimtree')", cmd = "NvimTreeToggle" })

		--  Icon Packs
		use({
			"kyazdani42/nvim-web-devicons",
			config = function()
				require("afnan.icons")
			end,
		})

		--  UI
		use({
			"br1anchen/nvim-colorizer.lua",
			cmd = "ColorizerToggle",
			config = function()
				require("colorizer").setup({
					"css",
					"javascript",
					lua = {
						mode = "virtualtext",
					},
				})
			end,
		})
		use({ "rcarriga/nvim-notify", config = "require('afnan.notify')" })
		use({ "petertriho/nvim-scrollbar", config = "require('afnan.scrollbar')" })

		--  Telescope & Its Extentions
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = "require('afnan.telescope')",
			after = "telescope-fzf-native.nvim",
		})
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make", cmd = "Telescope" })

		-- Tree-Sitter
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			config = "require('afnan.treesitter')",
		})
		use({ "windwp/nvim-ts-autotag", ft = { "html", "javascript", "javascriptreact" }, after = "nvim-treesitter" })
		use({ "p00f/nvim-ts-rainbow" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring", after = "Comment.nvim" })
		use({
			"windwp/nvim-autopairs",
			config = "require('afnan.autopairs')",
			after = "nvim-cmp",
		})

		--  Quick Tasking
		use({ "tpope/vim-repeat", keys = ".", lock = true })
		use({
			"numToStr/Comment.nvim",
			keys = { "gcc", "gc", "gb", "gbc" },
			config = "require('afnan.comments')",
		})
		use({ "mg979/vim-visual-multi", keys = "<C-n>", lock = true })

		--  Git
		use({ "lewis6991/gitsigns.nvim", config = "require('afnan.gitsigns')", event = "BufReadPost" })
		use({
			"rlch/github-notifications.nvim",
			config = function()
				require("afnan.github-notification")
			end,
			event = "BufWinEnter",
			lock = true,
		})
		use({ "pwntester/octo.nvim", cmd = "Octo" })
		use({ "TimUntersberger/neogit", requires = { "nvim-lua/plenary.nvim" }, cmd = "Neogit" })

		--  Language Server Protocol
		use({
			"neovim/nvim-lspconfig",
			config = "require('afnan.lsp')",
			after = "cmp-nvim-lsp",
		})
		use({ "jose-elias-alvarez/null-ls.nvim", config = "require('afnan.lsp.null_ls')", event = "BufWinEnter" })
		use({ "b0o/SchemaStore.nvim", lock = true })
		use({
			"j-hui/fidget.nvim",
			config = function()
				require("fidget").setup()
			end,
		})

		--  Snippets
		use({ "L3MON4D3/LuaSnip", event = "BufWinEnter", config = [[require("afnan.luasnips")]] })
		use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
		use({ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" })

		--  CMP
		use({
			"hrsh7th/nvim-cmp",
			event = "BufWinEnter",
			config = "require('afnan.lsp.cmp')",
		})
		use({ "hrsh7th/cmp-nvim-lua", ft = "lua", event = "InsertEnter" })
		use({ "hrsh7th/cmp-buffer", event = "InsertEnter" })
		use({ "hrsh7th/cmp-path", event = "InsertEnter" })
		use({
			"hrsh7th/cmp-nvim-lsp",
			requires = "nvim-cmp",
			event = "BufWinEnter",
		})
		use({ "tamago324/cmp-zsh", ft = "zsh", event = "InsertEnter", lock = true })
		use({ "hrsh7th/cmp-nvim-lsp-signature-help", after = "cmp-nvim-lsp", requires = "nvim-cmp" })

		--  Others
		use({ "rafcamlet/nvim-luapad", cmd = { "Luapad", "LuaRun" }, ft = "lus" })

		use({ "github/copilot.vim" })
		use({
			"ethanholz/nvim-lastplace",
			event = "BufRead",
			config = function()
				require("nvim-lastplace").setup({
					lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
					lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
					lastplace_open_folds = true,
				})
			end,
		})
		use({
			"folke/zen-mode.nvim",
			config = 'require("afnan.zen")',
			cmd = "ZenMode",
			lock = true,
		})

		use({ "~/dev/glean.nvim" })

		use({ "MunifTanjim/nui.nvim", config = "require('afnan.ui')" })

		--  Bootstraping Packer.nvim
		if packer_bootstrap then
			packer.sync()
		end
	end,
})
