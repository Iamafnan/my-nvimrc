local npairs = require("nvim-autopairs")
local autopairs = require("nvim-autopairs.completion.cmp")
local cmp = require("cmp")

npairs.setup({
	break_line_filetype = nil,
	check_ts = true,
	ts_config = {
		lua = { "string" },
		javascript = { "template_string" },
		java = false, 
	},
})

cmp.event:on("confirm_done", autopairs.on_confirm_done())
