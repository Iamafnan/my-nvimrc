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
		use({ "wbthomason/packer.nvim" })
		use({ "lewis6991/impatient.nvim" })
		use({ "nathom/filetype.nvim" })
		use({ "dracula/vim" })
		use({ "nvim-lualine/lualine.nvim" })
		use({ "glepnir/dashboard-nvim" })
		use({ "preservim/nerdtree" })

		--  Telescope & Its Extentions
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-lua/popup.nvim" })
		use({ "nvim-telescope/telescope.nvim" })
		use({ "ahmedkhalf/project.nvim" })
		use({ "AckslD/nvim-neoclip.lua", requires = { "tami5/sqlite.lua" } })

		--  Icon Packs
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "ryanoasis/vim-devicons" })

		--  UI
		use({ "romgrk/barbar.nvim" })
		use({ "Shatur/neovim-session-manager" })
		use({ "nvim-treesitter/nvim-treesitter" })

		--  Snippets
		use({ "SirVer/ultisnips" })
		use({ "honza/vim-snippets" })

		--  Quick Tasking
		use({ "tpope/vim-repeat" })
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
		use({ "kaputi/e-kaput.nvim" })
		use({ "ray-x/lsp_signature.nvim" })

		--  CMP
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-nvim-lsp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "lukas-reineke/cmp-rg" })
		use({ "hrsh7th/cmp-nvim-lua" })
		use({ "quangnguyen30192/cmp-nvim-ultisnips" })
		use({ "lukas-reineke/cmp-under-comparator" })

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
		compile_path = { fn.stdpath("config") .. "/lua/packer_compiled.lua" },
		profile = { enable = true, threshold = 1 },
	},
})
