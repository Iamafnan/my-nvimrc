local packer = require("packer")
local utils = require("packer.util")
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({
		"git clone --depth 1 https://github.com/wbthomason/packer.nvim",
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
		use({ "nathom/filetype.nvim" })
		use({
			"dracula/vim",
			as = "Dracula",
		})
		use({ "folke/tokyonight.nvim" })
		use({"tamton-aquib/staline.nvim", config = "require('afnan.statusline')"})
		use({ "akinsho/bufferline.nvim", config = "require('afnan.tabline')" })
		use({ "glepnir/dashboard-nvim", config = "require('afnan.dashboard')" })
		use({ "folke/which-key.nvim" })
		use({ "kyazdani42/nvim-tree.lua", config = "require('afnan.nvimtree')" })

		--  Icon Packs
		use({ "kyazdani42/nvim-web-devicons" })

		--  UI
		use({
			"Shatur/neovim-session-manager",
			requires = { "nvim-telescope/telescope.nvim" },
			config = "require('afnan.sessions')",
		})
		use({
			"rcarriga/nvim-notify",
			config = "require('afnan.notifications')",
			requires = { "nvim-telescope/telescope.nvim" },
		})
		use({ "akinsho/toggleterm.nvim", config = "require('afnan.toggleterm')" })
		use({
			"folke/todo-comments.nvim",
			config = "require('afnan.todo-comments')",
			requires = { "nvim-lua/plenary.nvim" },
		})
		use({
			"norcalli/nvim-colorizer.lua",
			event = "BufRead",
			config = "require('afnan.colorizer')",
		})

		--  Telescope & Its Extentions
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim" },
			config = "require('afnan.telescope')",
		})
		use({
			"ahmedkhalf/project.nvim",
			requires = { "nvim-telescope/telescope.nvim" },
			config = "require('afnan.project-nvim')",
		})
		use({
			"AckslD/nvim-neoclip.lua",
			requires = { "tami5/sqlite.lua" },
			config = "require('afnan.neoclip')",
		})

		-- Tree-Sitter
		use({ "nvim-treesitter/nvim-treesitter", config = "require('afnan.treesitter')" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects", after = "nvim-treesitter" })
		use({ "windwp/nvim-ts-autotag", after = "nvim-treesitter" })
		use({ "p00f/nvim-ts-rainbow" })
		use({ "JoosepAlviste/nvim-ts-context-commentstring", after = { "nvim-treesitter", "Comment.nvim" } })
		use({
			"windwp/nvim-autopairs",
			config = "require('afnan.autopairs')",
			after = "nvim-cmp",
		})

		--  Snippets
		use({ "hrsh7th/vim-vsnip", event = "InsertEnter" })
		use({ "lucaslamar/nodejs-snippets", after = "vim-vsnip", ft = "javascript" })
		use({ "kitagry/vs-snippets", after = "vim-vsnip" })
		use({
			"dsznajder/vscode-es7-javascript-react-snippets",
			after = "vim-vsnip",
			ft = { "javascript", "javascriptreact" },
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

		--  Git
		use({ "lewis6991/gitsigns.nvim", config = "require('afnan.gitsigns')" })

		--  Language Server Protocol
		use({ "neovim/nvim-lspconfig", config = { "require('afnan.lsp')" }, event = "BufWinEnter" })
		use({ "ray-x/lsp_signature.nvim", config = "require('afnan.lsp.signature')", after = "nvim-lspconfig" })
		use({ "kosayoda/nvim-lightbulb", after = "nvim-lspconfig" })
		use({ "tami5/lspsaga.nvim", after = "nvim-lspconfig", config = "require('afnan.lsp.saga')" })
		use({ "jose-elias-alvarez/null-ls.nvim", config = "require('afnan.lsp.null_ls')" })
		use({ "b0o/SchemaStore.nvim" })
		use({ "jose-elias-alvarez/nvim-lsp-ts-utils" })
		use({ "folke/lua-dev.nvim" })
		use({
			"wiliamks/nice-reference.nvim",
			requires = {
				"rmagatti/goto-preview",
				config = "require('goto-preview').setup({})",
			},
		})

		--  CMP
		use({ "hrsh7th/nvim-cmp", config = "require('afnan.cmp')" })
		use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lua", ft = "lua" })
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-vsnip", after = "vim-vsnip" })
		use({ "f3fora/cmp-spell", after = "nvim-cmp" })

		-- Markdown Preview
		use({ "ellisonleao/glow.nvim", cmd = "Glow", config = "require('afnan.glow')" })

		use({
			"vuki656/package-info.nvim",
			requires = { "MunifTanjim/nui.nvim", ft = "json" },
			ft = "json",
			config = "require('afnan.packageinfo')",
		})

		use({ "rafcamlet/nvim-luapad", cmd = "Luapad" })

		use({ "szw/vim-maximizer", cmd = "MaximizerToggle" })

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
