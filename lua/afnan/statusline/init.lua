local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local colors = require("afnan.statusline.colors")
local gls = gl.section
local ok, Job = pcall(require, "plenary.job")
if not ok then
	return ""
end
local status_ok, notifications = pcall(require, "github-notifications")
if not status_ok then
	return ""
end

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
		["fallback"] = mode_colors.snippet_replace,
	}
	return color[m] or colors.bg_light
end

---Disable component in dashboard, nvimtree and in empty buffer
---@return boolean
local function CommonCondition()
	local tbl = { ["dashboard"] = true, [""] = true, ["NvimTree"] = true }
	if tbl[vim.bo.filetype] then
		return false
	end
	return true
end

---Checks wheather lsp client is active or not
---@return boolean
local function LspCondition()
	local LspProvider = require("galaxyline.providers.lsp").get_lsp_client("", { "null-ls" })
	if LspProvider == "" then
		return false
	else
		return true
	end
end

---Disable shortline for all buffer else NvimTree
---@return boolean
local function ShortLineCondition()
	if vim.bo.filetype == "NvimTree" then
		return true
	else
		return false
	end
end

---Returns directory size
---@param cwd string
---@return string
local size
local function DirSize(cwd)
	Job
		:new({
			"du",
			cwd,
			"-sh",
			on_exit = function(job)
				local result = job:result()
				size = string.match(result[1], "(.*)\t")
            size = size .. "B"
			end,
		})
		:start()
	return size
end

local AndroidIcon = ""
local leftbracket = ""
local rightbracket = ""

-- Left Section

local a = 1

gls.left[a] = {
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

-- Git Stuff

a = a + 1
gls.left[a] = {
	GitSectionBracket1 = {
		provider = function()
			return " " .. leftbracket
		end,
		highlight = { colors.green, colors.bg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitIcon = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.green },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitSectionBracket2 = {
		provider = function()
			return rightbracket .. " "
		end,
		highlight = { colors.green, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}

a = a + 1
gls.left[a] = {
	GithubNotifications = {
		provider = function()
			return notifications.statusline_notification_count() .. ""
		end,
		highlight = { colors.orange, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitBranch = {
		provider = "GitBranch",
		highlight = { colors.fg, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitSectionExtraSpace = {
		provider = function()
			return " "
		end,
		highlight = { colors.green, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	DiffAdd = {
		provider = "DiffAdd",
		icon = "  ",
		highlight = { colors.green, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	DiffModified = {
		provider = "DiffModified",
		icon = " 柳 ",
		highlight = { colors.yellow, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	DiffRemove = {
		provider = "DiffRemove",
		icon = "  ",
		highlight = { colors.red, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitSectionBracket3 = {
		provider = function()
			return rightbracket .. " "
		end,
		highlight = { colors.gitBg, colors.bg },
		condition = condition.check_git_workspace,
	},
}

-- Lsp Sec
a = a + 1
gls.left[a] = {
	LspSectionBracket1 = {
		provider = function()
			return leftbracket
		end,
		highlight = { colors.blue, colors.bg },
		condition = function()
			return LspCondition()
		end,
	},
}
a = a + 1
gls.left[a] = {
	LspIcon = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.blue },
		condition = function()
			return LspCondition()
		end,
	},
}
a = a + 1
gls.left[a] = {
	LspSectionBracket2 = {
		provider = function()
			return rightbracket .. " "
		end,
		highlight = { colors.blue, colors.lspBg },
		condition = function()
			return LspCondition()
		end,
	},
}
a = a + 1
gls.left[a] = {
	LspName = {
		provider = function()
			return require("galaxyline.providers.lsp").get_lsp_client("", { "null-ls" })
		end,
		highlight = { colors.fg, colors.lspBg },
		condition = function()
			return LspCondition()
		end,
	},
}
a = a + 1
gls.left[a] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "   ",
		highlight = { colors.red, colors.lspBg },
		condition = function()
			return LspCondition()
		end,
	},
}
a = a + 1
gls.left[a] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "   ",
		highlight = { colors.yellow, colors.lspBg },
		condition = function()
			return LspCondition()
		end,
	},
}
a = a + 1
gls.left[a] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "   ",
		highlight = { colors.cyan, colors.lspBg },
		condition = function()
			return LspCondition()
		end,
	},
}

a = a + 1
gls.left[a] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "   ",
		highlight = { colors.blue, colors.lspBg },
		condition = function()
			return LspCondition()
		end,
	},
}
a = a + 1
gls.left[a] = {
	LspSectionBracket3 = {
		provider = function()
			return rightbracket
		end,
		highlight = { colors.lspBg, colors.bg },
		condition = function()
			return LspCondition()
		end,
	},
}

-- Right Section

local b = 1
gls.right[b] = {
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
b = b + 1
gls.right[b] = {
	FileIcon = {
		provider = "FileIcon",
		highlight = { colors.bg, colors.orange },
		condition = function()
			return CommonCondition()
		end,
	},
}
b = b + 1
gls.right[b] = {
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
b = b + 1
gls.right[b] = {
	CursorPosition = {
		provider = function()
			local line = vim.fn.line(".")
			local column = vim.fn.col(".")
			return string.format("%3d:%2d", line, column)
		end,
		highlight = { colors.fg, colors.fileinfoBg },
		condition = function()
			return CommonCondition()
		end,
	},
}
b = b + 1
gls.right[b] = {
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

-- Short statusline left
local c = 1
gls.short_line_left[c] = {
	ShortLineBracket1 = {
		provider = function()
			return leftbracket
		end,
		highlight = { colors.blue, colors.bg },
		condition = function()
			return ShortLineCondition()
		end,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineIcon = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.blue },
		condition = function()
			return ShortLineCondition()
		end,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineBracket2 = {
		provider = function()
			return rightbracket
		end,
		highlight = { colors.blue, colors.lspBg },
		condition = function()
			return ShortLineCondition()
		end,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineCurrentCWD = {
		provider = function()
			return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		end,
		highlight = { colors.fg, colors.lspBg },
		condition = function()
			return ShortLineCondition()
		end,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineBracket3 = {
		provider = function()
			return rightbracket
		end,
		highlight = { colors.lspBg, colors.bg },
		condition = function()
			return ShortLineCondition()
		end,
	},
}

-- Short line right
local d = 1
gls.short_line_right[d] = {
	ShortLineBracket4 = {
		provider = function()
			return leftbracket
		end,
		highlight = { colors.blue, colors.bg },
		condition = function()
			return ShortLineCondition()
		end,
	},
}

d = d + 1
gls.short_line_right[d] = {
	DirectorySize = {
		provider = function()
			return DirSize(vim.fn.getcwd())
		end,
		highlight = { colors.bg, colors.blue },
		condition = function()
			return ShortLineCondition()
		end,
	},
}

d = d + 1
gls.short_line_right[d] = {
	ShortLineBracket5 = {
		provider = function()
			return rightbracket
		end,
		highlight = { colors.blue, colors.bg },
		condition = function()
			return ShortLineCondition()
		end,
	},
}
