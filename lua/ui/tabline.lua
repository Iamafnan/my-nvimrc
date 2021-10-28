local bufferline = require("bufferline")

local function diagnostics_indicator(_, _, diagnostics)
	local symbols = { error = " ", warning = " ", info = " " }
	local result = {}
	for name, count in pairs(diagnostics) do
		if symbols[name] and count > 0 then
			table.insert(result, symbols[name] .. count)
		end
	end
	result = table.concat(result, " ")
	return #result > 0 and result or ""
end

bufferline.setup({
	options = {
		diagnostics = "nvim_lsp",
		diagnostics_indicator = diagnostics_indicator,
		diagnostics_update_in_insert = true,
		offsets = {
			filetype = "packer",
			text = "Packer",
			highlight = "PanelHeading",
			padding = 1,
		},
	},
})
