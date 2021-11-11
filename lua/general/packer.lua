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

return packer.startup({
	function()
		--  Loaded First
		use({ "wbthomason/packer.nvim" })
		use({ "lewis6991/impatient.nvim" })
		use({ "navarasu/onedark.nvim" })
		use({ "nvim-lualine/lualine.nvim" })
		use({ "glepnir/dashboard-nvim" })
		use({ "preservim/nerdtree" })

		--  Telescope & Its Extentions
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-lua/popup.nvim" })
		use({ "nvim-telescope/telescope.nvim" })
		use({ "ahmedkhalf/project.nvim" })
		use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
		use({ "AckslD/nvim-neoclip.lua", requires = { "tami5/sqlite.lua", module = "sqlite" } })

		--  Icon Packs
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "ryanoasis/vim-devicons" })

		--  UI
		use({ "romgrk/barbar.nvim" })
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

		--  Bootstraping Packer.nvim
		if packer_bootstrap then
			packer.sync()
		end
	end,
	config = {
		display = {
			open_fn = function()
				return utils.float({ border = "single" })
			end,
		},
		compile_path = { fn.stdpath("config") .. "/lua/packer_compiled.lua" },
		profile = { enable = true, threshold = 1 },
	},
})
