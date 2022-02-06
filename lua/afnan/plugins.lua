local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	print("Installing packer.nvim")
	fn.delete(vim.fn.stdpath("config") .. "/lua/packer_compiled.lua")
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

packer.init({
	git = { clone_timeout = 350 },
	compile_path = "~/.config/nvim/lua/afnan/packer_compiled.lua",
	display = {
		title = "Packer",
		done_sym = "",
		error_syn = "×",
		keybindings = { toggle_info = "o" },
	},
})

return packer.startup({
	function(use)
		use({ "lewis6991/impatient.nvim" })
		use({ "nathom/filetype.nvim" })
		use({ "wbthomason/packer.nvim" })
		use({ "tweekmonster/startuptime.vim", cmd = "StartupTime" })
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
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })

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
		use({ "danymat/neogen", after = "nvim-cmp" })

		--  Quick Tasking
		use({ "tpope/vim-repeat", keys = "." })
		use({
			"numToStr/Comment.nvim",
			keys = { "gcc", "gc", "gb", "gbc" },
			config = "require('afnan.comments')",
		})
		use({ "mg979/vim-visual-multi", keys = "<C-n>" })
		use({
			"blackCauldron7/surround.nvim",
			opt = true,
			config = function()
				require("surround").setup({ mappings_style = "surround" })
			end,
		})
		use({ "abecodes/tabout.nvim", event = "InsertEnter" })

		--  Git
		use({ "lewis6991/gitsigns.nvim", config = "require('afnan.gitsigns')", event = "BufReadPost" })
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
		use({ "ray-x/lsp_signature.nvim", config = "require('afnan.lsp.signature')", event = "BufWinEnter" })
		use({ "kosayoda/nvim-lightbulb", event = "BufWinEnter" })
		use({ "tami5/lspsaga.nvim", event = "BufWinEnter", config = "require('afnan.lsp.saga')" })
		use({ "jose-elias-alvarez/null-ls.nvim", config = "require('afnan.lsp.null_ls')", event = "BufWinEnter" })
		use({ "b0o/SchemaStore.nvim", ft = { "json", "yaml", "yml" } })
		use({ "folke/lua-dev.nvim", ft = "lua" })
		use({
			"wiliamks/nice-reference.nvim",
			requires = {
				"rmagatti/goto-preview",
				config = "require('goto-preview').setup({})",
			},
		})
		use({ "j-hui/fidget.nvim", event = "BufWinEnter", config = "require('afnan.lsp.fidget')" })

		-- Snippets
		use({ "L3MON4D3/LuaSnip", event = "BufWinEnter", config = [[require("afnan.luasnips")]] })
		use({ "rafamadriz/friendly-snippets", event = "InsertEnter" })
		use({ "xmasdsamx/abusaidm.html-snippets-0.0.18", after = "LuaSnip", event = "InsertEnter" })
		use({ "saadparwaiz1/cmp_luasnip", event = "InsertEnter" })

		--  CMP
		use({
			"hrsh7th/nvim-cmp",
			event = "BufWinEnter",
			config = "require('afnan.cmp')",
		})
		use({ "hrsh7th/cmp-nvim-lua", ft = "lua", event = "InsertEnter" })
		use({ "hrsh7th/cmp-buffer", event = "InsertEnter" })
		use({ "hrsh7th/cmp-path", event = "InsertEnter" })
		use({ "hrsh7th/cmp-nvim-lsp" })

		--  Others
		use({
			"vuki656/package-info.nvim",
			requires = { "MunifTanjim/nui.nvim", ft = "json" },
			ft = "json",
			config = "require('afnan.packageinfo')",
		})

		use({ "rafcamlet/nvim-luapad", ft = "lua" })
		use({ "github/copilot.vim", event = "InsertEnter" })
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
		log = { level = "debug" },
		max_jobs = 10,
		git = {
			clone_timeout = 300,
			subcommands = {
				fetch = "fetch --no-tags --no-recurse-submodules --update-shallow --progress",
			},
		},
	},
})
