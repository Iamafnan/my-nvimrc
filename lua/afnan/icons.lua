local devicons = require("nvim-web-devicons")
local colors = require("afnan.statusline.colors")
devicons.setup({
	override = {
		html = {
			icon = "",
			color = "#E34F26",
			name = "HTML",
		},
		css = {
			icon = "",
			color = "#1572B6",
			name = "CSS",
		},
		js = {
			icon = "",
			color = "#F7DF1E",
			name = "JavaScript",
		},
		ts = {
			icon = "ﯤ",
			color = "#3178C6",
			name = "TypeScript",
		},
		Dockerfile = {
			icon = "",
			color = "#2496ED",
			name = "Dockerfile",
		},
		rb = {
			icon = "",
			color = "#CC342D",
			name = "Ruby",
		},
		py = {
			icon = "",
			color = "#3776AB",
			name = "Python",
		},
		json = {
			icon = "",
			color = "#999999",
			name = "JSON",
		},
		toml = {
			icon = "",
			color = "#999999",
			name = "TOML",
		},
		yaml = {
			icon = "",
			color = "#999999",
			name = "YAML",
		},
		lock = {
			icon = "",
			color = "#DE6B74",
			name = "lock",
		},
		bash = {
			icon = "",
			color = "#4EAA25",
			name = "BASH",
		},
		zsh = {
			icon = "",
			color = "#4EAA25",
			name = "Zsh",
		},
	},
})

devicons.set_icon({
	NvimTree = {
		icon = "",
		color = "#7aa2f7",
		name = "NvimTree",
	},
})
