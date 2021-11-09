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
		use({ "wbthomason/packer.nvim" })
		use({ "lewis6991/impatient.nvim" })
		use({ "dracula/vim", as = "dracula" })
		use({ "Mofiqul/vscode.nvim" })
		use({ "nvim-lualine/lualine.nvim" })
		use({ "glepnir/dashboard-nvim" })
		use({ "preservim/nerdtree" })

		--  Telescope & Its Extentions
		use({
			"nvim-telescope/telescope.nvim",
			requires = { "nvim-lua/plenary.nvim", "kyazdani42/nvim-web-devicons", "nvim-lua/popup.nvim" },
		})
		use({ "ahmedkhalf/project.nvim" })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "AckslD/nvim-neoclip.lua", requires = { "tami5/sqlite.lua", module = "sqlite" } })

		--  Icon Packs
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "ryanoasis/vim-devicons" })

		--  UI
		use({ "romgrk/barbar.nvim", requires = { "kyazdani42/nvim-web-devicons" } })
		use({ "nvim-treesitter/nvim-treesitter" })
		use({ "karb94/neoscroll.nvim" })

		--  Snippets
		use({ "SirVer/ultisnips" })
		use({ "honza/vim-snippets" })
		use({ "mlaursen/vim-react-snippets" })

		--  Quick Tasking
		use({ "windwp/nvim-autopairs" })
		use({ "tpope/vim-commentary" })
		use({ "mg979/vim-visual-multi" })
		use({ "sbdchd/neoformat" })
		use({ "tpope/vim-surround" })

		--  Git
		use({ "lewis6991/gitsigns.nvim" })
		use({ "kdheepak/lazygit.nvim" })

		--  Language Server Protocol
		use({ "neovim/nvim-lspconfig" })
		use({ "onsails/lspkind-nvim" })
		use({ "kaputi/e-kaput.nvim" })
		use({ "RRethy/vim-illuminate" })
		use({ "ray-x/lsp_signature.nvim" })
		use({ "b0o/SchemaStore.nvim" })

		--  CMP
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-nvim-lua" })
		use({ "quangnguyen30192/cmp-nvim-ultisnips" })
	end,
	config = {
		compile_path = { vim.fn.stdpath("config") .. "/lua/packer_compiled.lua" },
	},
})
