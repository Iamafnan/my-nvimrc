local ok, neogen = require("neogen")
if not ok then
	return
end

require("neogen").setup({
	enabled = true,
	languages = {
		lua = {
			template = {
				annotation_convention = "emmylua",
			},
		},
	},
})
