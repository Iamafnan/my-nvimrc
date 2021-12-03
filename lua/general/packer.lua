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
		use({ "folke/which-key.nvim" })
		use({ "preservim/nerdtree" })

		--  Icon Packs
		use({ "kyazdani42/nvim-web-devicons" })
		use({ "ryanoasis/vim-devicons" })

		--  UI
		use({ "romgrk/barbar.nvim" })
		use({ "Shatur/neovim-session-manager" })
		use({ "rcarriga/nvim-notify" })
		use({ "akinsho/toggleterm.nvim" })

		--  Telescope & Its Extentions
		use({ "nvim-lua/plenary.nvim" })
		use({ "nvim-lua/popup.nvim" })
		use({ "nvim-telescope/telescope.nvim" })
		use({ "ahmedkhalf/project.nvim" })
		use({ "AckslD/nvim-neoclip.lua", requires = { "tami5/sqlite.lua" } })
      use({ "nvim-telescope/telescope-github.nvim" })

      -- Tree-Sitter
		use({ "nvim-treesitter/nvim-treesitter" })
		use({ "nvim-treesitter/nvim-treesitter-textobjects" })
		use({ "windwp/nvim-ts-autotag" })
		use({ "windwp/nvim-autopairs" })

		--  Snippets
      use({ "L3MON4D3/LuaSnip" })
      use({ "rafamadriz/friendly-snippets" })

		--  Quick Tasking
		use({ "tpope/vim-repeat" })
		use({ "terrortylor/nvim-comment" })
		use({ "mg979/vim-visual-multi" })
		use({ "tpope/vim-surround" })
      use({ "mattn/emmet-vim", ft = { "css", "html" } })

		--  Git
		use({ "lewis6991/gitsigns.nvim" })

		--  Language Server Protocol
		use({ "neovim/nvim-lspconfig" })
		use({ "ray-x/lsp_signature.nvim" })
		use({ "filipdutescu/renamer.nvim" })

		--  CMP
		use({ "hrsh7th/nvim-cmp" })
		use({ "hrsh7th/cmp-buffer" })
		use({ "hrsh7th/cmp-path" })
		use({ "hrsh7th/cmp-nvim-lua" })
		use({ "lukas-reineke/cmp-under-comparator" })
      use({ "saadparwaiz1/cmp_luasnip" })
		use({ "hrsh7th/cmp-nvim-lsp" })

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
