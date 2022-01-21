local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local colors = require("afnan.statusline.colors")
local gls = gl.section

gl.short_line_list = { "NvimTree" }

--[[
-- Useful functions and locals
--]]

local function mode_color(m)
	local mode_colors = {
		normal = colors.blue,
		insert = colors.green,
		visual = colors.purple,
		replace = colors.red,
		snippet_replace = colors.cyan,
	}

	local color = {
		n = mode_colors.normal,
		i = mode_colors.insert,
		c = mode_colors.replace,
		R = mode_colors.replace,
		t = mode_colors.insert,
		[""] = mode_colors.visual,
		V = mode_colors.visual,
		v = mode_colors.visual,
	}
	return color[m] or colors.bg_light
end

local function CommonCondition()
	local tbl = { ["dashboard"] = true, [""] = true, ["NvimTree"] = true }
	if tbl[vim.bo.filetype] then
		return false
	end
	return true
end

local function GitCondition()
  return condition.check_git_workspace
end

local AndroidIcon = ""
local leftbracket = ""
local rightbracket = ""

-- Left Section
gls.left[1] = {
	ModeColor = {
		icon = "  " .. AndroidIcon,
		separator = rightbracket,
		separator_highlight = "GalaxyModeColorReverse",
		highlight = { colors.bg, mode_color() },
		provider = function()
			local m = vim.fn.mode() or vim.fn.visualmode()
			local color = mode_color(m)
			vim.api.nvim_command("hi GalaxyModeColor guibg=" .. color)
			vim.api.nvim_command("hi GalaxyModeColorReverse guifg=" .. color)
			return " "
		end,
		condition = function()
			return CommonCondition()
		end,
	},
}

gls.left[2] = {
	CMD = {
		separator = rightbracket .. "  ",
		separator_highlight = function()
			return { colors.bg_dark, condition.buffer_not_empty() and colors.bg_dim or colors.bg }
		end,
		highlight = { mode_color(), colors.bg_dark },
		provider = function()
			local dirname = vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
			return "  " .. dirname .. " "
		end,
		condition = function()
			return CommonCondition()
		end,
	},
}

-- Git Stuff
gls.left[3] = {
	GitSectionBracket1 = {
		provider = function()
			return leftbracket
		end,
		highlight = { colors.green, colors.bg },
		condition = function()
			return {
				CommonCondition(),
				GitCondition(),
			}
		end,
	},
}
gls.left[4] = {
	GitIcon = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.green },
		condition = function()
			return {
				CommonCondition(),
				GitCondition(),
			}
		end,
	},
}
gls.left[5] = {
	GitSectionBracket2 = {
		provider = function()
			return rightbracket .. " "
		end,
		highlight = { colors.green, colors.gitBg },
		condition = function()
			return {
				CommonCondition(),
				GitCondition(),
			}
		end,
	},
}

gls.left[6] = {
	GithubNotifications = {
		provider = function()
			return require("github-notifications").statusline_notification_count() .. " "
		end,
		highlight = { colors.orange, colors.gitBg },
		condition = function()
			return {
				CommonCondition(),
				GitCondition(),
			}
		end,
	},
}
gls.left[7] = {
	GitBranch = {
		provider = "GitBranch",
		highlight = { colors.fg, colors.gitBg },
		condition = function()
			return {
				CommonCondition(),
				GitCondition(),
			}
		end,
	},
}
gls.left[8] = {
	DiffAdd = {
		provider = "DiffAdd",
		icon = "   ",
		highlight = { colors.green, colors.gitBg },
	},
}
gls.left[9] = {
	DiffModified = {
		provider = "DiffModified",
		icon = "柳 ",
		highlight = { colors.yellow, colors.gitBg },
	},
}
gls.left[10] = {
	DiffRemove = {
		provider = "DiffRemove",
		icon = " ",
		highlight = { colors.red, colors.gitBg },
	},
}
gls.left[11] = {
	GitSectionBracket3 = {
		provider = function()
			return rightbracket .. " "
		end,
		highlight = { colors.gitBg, colors.bg },
		condition = function()
			return {
				CommonCondition(),
				GitCondition(),
			}
		end,
	},
}

gls.left[12] = {
	LspSectionBracket1 = {
		provider = function()
			return leftbracket
		end,
		highlight = { colors.blue, colors.bg },
		condition = function()
			return CommonCondition()
		end,
	},
}

gls.left[13] = {
	LspIcon = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.blue },
		condition = function()
			return CommonCondition()
		end,
	},
}
gls.left[14] = {
	LspSectionBracket2 = {
		provider = function()
			return rightbracket .. " "
		end,
		highlight = { colors.blue, colors.lspBg },
		condition = function()
			return CommonCondition()
		end,
	},
}

gls.left[15] = {
	LspName = {
		provider = function()
			return require("galaxyline.providers.lsp").get_lsp_client("", { "null-ls" })
		end,
		highlight = { colors.fg, colors.lspBg },
		condition = function()
			return CommonCondition()
		end,
	},
}
gls.left[16] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "   ",
		highlight = { colors.red, colors.lspBg },
	},
}
gls.left[17] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "   ",
		highlight = { colors.yellow, colors.lspBg },
	},
}

gls.left[18] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "   ",
		highlight = { colors.cyan, colors.lspBg },
	},
}

gls.left[19] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "   ",
		highlight = { colors.blue, colors.lspBg },
	},
}
gls.left[20] = {
	LspSectionBracket3 = {
		provider = function()
			return rightbracket
		end,
		highlight = { colors.lspBg, colors.bg },
		condition = function()
			return CommonCondition()
		end,
	},
}

-- Right Section

gls.right[1] = {
	FileInfoSectionBracket1 = {
		provider = function()
			return leftbracket
		end,
		highlight = { colors.orange, colors.bg },
		condition = function()
			return CommonCondition()
		end,
	},
}
gls.right[2] = {
	FileIcon = {
		provider = "FileIcon",
		highlight = { colors.bg, colors.orange },
		condition = function()
			return CommonCondition()
		end,
	},
}
gls.right[3] = {
	FileInfoSectionBracket2 = {
		provider = function()
			return rightbracket .. " "
		end,
		highlight = { colors.orange, colors.fileinfoBg },
		condition = function()
			return CommonCondition()
		end,
	},
}
gls.right[4] = {
	CursorPosition = {
		provider = function()
			local line = vim.fn.line(".")
			local column = vim.fn.col(".")
			return string.format("%3d:%2d ", line, column)
		end,
		highlight = { colors.fg, colors.fileinfoBg },
		condition = function()
			return CommonCondition()
		end,
	},
}
gls.right[5] = {
	FileInfoSectionBracket3 = {
		provider = function()
			return rightbracket
		end,
		highlight = { colors.fileinfoBg, colors.bg },
		condition = function()
			return CommonCondition()
		end,
	},
}
