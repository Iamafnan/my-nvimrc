local cmp = require("cmp")
local cmd = vim.cmd
local set = vim.opt
local kind_icons = require("afnan.lsp.kinds").kind

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end

-- Configuration
cmp.setup({
	completion = { keyword_length = 1},
	snippet = {
      expand = function(args)
         vim.fn["vsnip#anonymous"](args.body)
      end,
	},
	mapping = {
		["<cr>"] = cmp.mapping.confirm({ select = true }),
      ["<tab>"] = cmp.mapping(function(fallback)
         feedkey("<plug>(vsnip-expand-or-jump)", "") 
      end, { "i", "s" })},
      ["<A-Tab>"] = cmp.mapping(function()
          feedkey("<Plug>(vsnip-jump-prev)", "")
      end, { "i", "s" }),
	sources = {
		{ name = "nvim_lsp" },
		{ name = "buffer" },
      { name = "vsnip" },
		{ name = "path" },
		{ name = "emmet" },
		{ name = "nvim_lua" },
	},
	experimental = { ghost_text = true, native_menu = false },
	documentation = { border = solid },
	formatting = {
		fields = { "kind", "abbr" },
		format = function(entry, vim_item)
			vim_item.abbr = vim_item.abbr:sub(1, 30)
			vim_item.kind = kind_icons[vim_item.kind]
			return vim_item
		end,
	},
	sorting = {
		comparators = {
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
         function(entry1, entry2)
            local _, entry1_under = entry1.completion_item.label:find "^_+"
            local _, entry2_under = entry2.completion_item.label:find "^_+"
            entry1_under = entry1_under or 0
            entry2_under = entry2_under or 0
            if entry1_under > entry2_under then
               return false
            elseif entry1_under < entry2_under then
               return true
            end
         end,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
		},
	},
})

-- completion menu settings
set.pumheight = 8
