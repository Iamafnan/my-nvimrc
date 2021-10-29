-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
-- "                                                                            "
-- "            ____    _       _   _    ____   ___   _   _   ____              "
-- "           |  _ \  | |     | | | |  / ___| |_ _| | \ | | / ___|             "
-- "           | |_) | | |     | | | | | |  _   | |  |  \| | \___ \             "
-- "           |  __/  | |___  | |_| | | |_| |  | |  | |\  |  ___) |            "
-- "           |_|     |_____|  \___/   \____| |___| |_| \_| |____/             "
-- "                                                                            "
-- """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vim.cmd([[packadd packer.nvim]])

return require("packer").startup({
	function()
		--  Loaded First
		use("wbthomason/packer.nvim")
		use({ "lewis6991/impatient.nvim" })
		use({ "dracula/vim", as = "dracula" })
		use({ "folke/which-key.nvim" })
		use({ "preservim/nerdtree" })

		--  Telescope & Its Extentions
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "nvim-lua/popup.nvim" },
		})
		use({ "ahmedkhalf/project.nvim" })

		--  Icon Packs
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "ryanoasis/vim-devicons" })

		--  UI
		use({ "akinsho/bufferline.nvim", requires = "kyazdani42/nvim-web-devicons" })
		use({ "beauwilliams/statusline.lua" })
		use({ "nvim-treesitter/nvim-treesitter" })
		use({ "pangloss/vim-javascript", ft = "javascript" })

		--  Snippets
		use({ "L3MON4D3/LuaSnip" })
		use({ "saadparwaiz1/cmp_luasnip" })
		use({ "rafamadriz/friendly-snippets" })

		--  Quick Tasking
		use({ "windwp/nvim-autopairs" })
		use({ "tpope/vim-commentary" })
		use({ "mg979/vim-visual-multi" })
		use({ "sbdchd/neoformat" })
		use({ "tpope/vim-surround" })
		use({ "moll/vim-node", ft = "javascript" })

		--  Git
		use({ "lewis6991/gitsigns.nvim" })
		use({ "kdheepak/lazygit.nvim" })

		--  Language Server Protocol
		use({ "neovim/nvim-lspconfig" })
		use({ "onsails/lspkind-nvim" })
		use({ "glepnir/lspsaga.nvim" })
		use({ "kaputi/e-kaput.nvim" })
		use({ "ray-x/lsp_signature.nvim" })

		--  CMP
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-nvim-lua" })

		-- Copilot
		use({ "github/copilot.vim" })
	end,
	config = {
		compile_path = { vim.fn.stdpath("config") .. "/lua/packer_compiled.lua" },
	},
})
