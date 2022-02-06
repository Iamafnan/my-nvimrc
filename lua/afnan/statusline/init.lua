local gl = require("galaxyline")
local condition = require("galaxyline.condition")
local colors = require("afnan.statusline.colors")
local gls = gl.section
local size
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
-- Useful functions
--]]

local function mode_color(m)
	local mode_colors = {
		n = colors.blue,
		i = colors.green,
		v = colors.purple,
		[""] = colors.purple,
		V = colors.purple,
		c = colors.magenta,
		no = colors.blue,
		s = colors.orange,
		S = colors.orange,
		ic = colors.yellow,
		R = colors.red,
		Rv = colors.red,
		cv = colors.blue,
		ce = colors.blue,
		r = colors.replacecolor,
		rm = colors.replacecolor,
		["r?"] = colors.cyan,
		["!"] = colors.blue,
		t = colors.blue,
	}
	return mode_colors[m]
end

local function CommonCondition()
	local tbl = { ["dashboard"] = true, [""] = true, ["NvimTree"] = true }
	if tbl[vim.bo.filetype] then
		return false
	end
	return true
end

local function NvimTreeLineCondition()
	if vim.bo.filetype == "NvimTree" then
		return true
	else
		return false
	end
end

local function DirSize()
	local cwd = vim.fn.getcwd()
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

local function GetNulllsClient()
	local ft = vim.bo.filetype
	local sources = require("null-ls.sources").get_available(ft)
	local source = ""
	for _, provider in pairs(sources) do
		if string.len(source) < 1 then
			source = source .. provider.name
		else
			source = source .. "," .. provider.name
		end
	end
	return source
end

local function GetLspClient()
	local lsp_clients = require("galaxyline.providers.lsp").get_lsp_client("", { "null-ls" })
	local null_ls_clients = GetNulllsClient()
	if string.len(lsp_clients) > 0 then
		return lsp_clients .. "," .. null_ls_clients
	else
		return null_ls_clients
	end
end

local function LspCondition()
	local lsp_clients = GetLspClient()
	if string.len(lsp_clients) > 1 then
		return true
	else
		return false
	end
end

local function GetGitBranch()
	if vim.bo.filetype == "dashboard" then
		return ""
	else
		return require("galaxyline.providers.vcs").get_git_branch()
	end
end

local function GetGitNotifications()
	if vim.bo.filetype == "dashboard" then
		return ""
	else
		return notifications.statusline_notification_count() .. ""
	end
end

local function GetCursorPostion()
	local line = vim.fn.line(".")
	local column = vim.fn.col(".")
	return string.format("%3d:%2d", line, column)
end

local function GetModeColor()
	local m = vim.fn.mode() or vim.fn.visualmode()
	local color = mode_color(m)
	vim.api.nvim_command("hi GalaxyModeColor guibg=" .. color)
	vim.api.nvim_command("hi GalaxyModeColorReverse guifg=" .. color)
	return " "
end

-- local unstaged_files = 0
-- local function GetGitComponent()
-- 	Job
-- 		:new({
-- 			"git",
-- 			"diff",
-- 			"--name-only",
-- 			on_exit = function(job)
-- 				for _ in pairs(job:result()) do
-- 					unstaged_files = unstaged_files + 1
-- 				end
-- 				return unstaged_files
-- 			end,
-- 		})
-- 		:start()
--
-- 	local total_files = 0
-- 	Job
-- 		:new({
-- 			"git",
-- 			"ls-files",
-- 			on_exit = function(job)
-- 				for _ in pairs(job:result()) do
-- 					total_files = total_files + 1
-- 				end
-- 				return total_files
-- 			end,
-- 		})
-- 		:start()
-- end

-- GetGitComponent()

local function GetLeftBracket()
	if vim.bo.filetype == "dashboard" then
		return ""
	else
		return " " .. ""
	end
end

local function GetRightBracket()
	if vim.bo.filetype == "dashboard" then
		return ""
	else
		return "" .. " "
	end
end

-- Left Section

local a = 1
gls.left[a] = {
	ModeColor = {
		icon = "  ",
		separator = "",
		separator_highlight = "GalaxyModeColorReverse",
		highlight = { colors.bg, mode_color() },
		provider = GetModeColor,
		condition = CommonCondition,
	},
}

a = a + 1
gls.left[a] = {
	GitSectionBracket1 = {
		provider = GetLeftBracket,
		highlight = { colors.green, colors.bg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitIcon = {
		provider = function()
			if vim.bo.filetype == "dashboard" then
				return ""
			else
				return ""
			end
		end,
		highlight = { colors.bg, colors.green },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitSectionBracket2 = {
		provider = GetRightBracket,
		highlight = { colors.green, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}

a = a + 1
gls.left[a] = {
	GithubNotifications = {
		provider = GetGitNotifications,
		highlight = { colors.orange, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitBranch = {
		provider = GetGitBranch,
		highlight = { colors.fg, colors.gitBg },
		condition = condition.check_git_workspace,
	},
}
a = a + 1
gls.left[a] = {
	GitSectionExtraSpace = {
		provider = function()
			if vim.bo.filetype == "dashboard" then
				return ""
			else
				return " "
			end
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
		provider = GetRightBracket,
		highlight = { colors.gitBg, colors.bg },
		condition = condition.check_git_workspace,
	},
}

a = a + 1
gls.left[a] = {
	LspSectionBracket1 = {
		provider = GetLeftBracket,
		highlight = { colors.blue, colors.bg },
		condition = LspCondition,
	},
}
a = a + 1
gls.left[a] = {
	LspIcon = {
		provider = function()
			return ""
		end,
		highlight = { colors.bg, colors.blue },
		condition = LspCondition,
	},
}
a = a + 1
gls.left[a] = {
	LspSectionBracket2 = {
		provider = GetRightBracket,
		highlight = { colors.blue, colors.lspBg },
		condition = LspCondition,
	},
}
a = a + 1
gls.left[a] = {
	LspName = {
		provider = GetLspClient,
		highlight = { colors.fg, colors.lspBg },
		condition = LspCondition,
	},
}
a = a + 1
gls.left[a] = {
	DiagnosticError = {
		provider = "DiagnosticError",
		icon = "   ",
		highlight = { colors.red, colors.lspBg },
		condition = LspCondition,
	},
}
a = a + 1
gls.left[a] = {
	DiagnosticWarn = {
		provider = "DiagnosticWarn",
		icon = "   ",
		highlight = { colors.yellow, colors.lspBg },
		condition = LspCondition,
	},
}
a = a + 1
gls.left[a] = {
	DiagnosticHint = {
		provider = "DiagnosticHint",
		icon = "   ",
		highlight = { colors.cyan, colors.lspBg },
		condition = LspCondition,
	},
}

a = a + 1
gls.left[a] = {
	DiagnosticInfo = {
		provider = "DiagnosticInfo",
		icon = "   ",
		highlight = { colors.blue, colors.lspBg },
		condition = LspCondition,
	},
}
a = a + 1
gls.left[a] = {
	LspSectionBracket3 = {
		provider = GetRightBracket,
		highlight = { colors.lspBg, colors.bg },
		condition = LspCondition,
	},
}

-- Right Section

local b = 1
gls.right[b] = {
	FileInfoSectionBracket1 = {
		provider = GetLeftBracket,
		highlight = { colors.orange, colors.bg },
		condition = CommonCondition,
	},
}
b = b + 1
gls.right[b] = {
	FileIcon = {
		provider = "FileIcon",
		highlight = { colors.bg, colors.orange },
		condition = CommonCondition,
	},
}
b = b + 1
gls.right[b] = {
	FileInfoSectionBracket2 = {
		provider = GetRightBracket,
		highlight = { colors.orange, colors.fileinfoBg },
		condition = CommonCondition,
	},
}
b = b + 1
gls.right[b] = {
	CursorPosition = {
		provider = GetCursorPostion,
		highlight = { colors.fg, colors.fileinfoBg },
		condition = CommonCondition,
	},
}
b = b + 1
gls.right[b] = {
	FileInfoSectionBracket3 = {
		provider = GetRightBracket,
		highlight = { colors.fileinfoBg, colors.bg },
		condition = CommonCondition,
	},
}

-- Short statusline left
local c = 1
gls.short_line_left[c] = {
	ShortLineBracket1 = {
		provider = GetLeftBracket,
		highlight = { colors.blue, colors.bg },
		condition = NvimTreeLineCondition,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineIcon = {
		provider = function()
			return " "
		end,
		highlight = { colors.bg, colors.blue },
		condition = NvimTreeLineCondition,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineBracket2 = {
		provider = GetRightBracket,
		highlight = { colors.blue, colors.lspBg },
		condition = NvimTreeLineCondition,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineCurrentCWD = {
		provider = function()
			return "  " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
		end,
		highlight = { colors.fg, colors.lspBg },
		condition = NvimTreeLineCondition,
	},
}

c = c + 1
gls.short_line_left[c] = {
	ShortLineBracket3 = {
		provider = GetRightBracket,
		highlight = { colors.lspBg, colors.bg },
		condition = NvimTreeLineCondition,
	},
}

-- Short line right
local d = 1
gls.short_line_right[d] = {
	ShortLineBracket4 = {
		provider = GetLeftBracket,
		highlight = { colors.blue, colors.bg },
		condition = NvimTreeLineCondition,
	},
}

d = d + 1
gls.short_line_right[d] = {
	DirectorySize = {
		provider = DirSize,
		highlight = { colors.bg, colors.blue },
		condition = NvimTreeLineCondition,
	},
}

d = d + 1
gls.short_line_right[d] = {
	ShortLineBracket5 = {
		provider = GetRightBracket,
		highlight = { colors.blue, colors.bg },
		condition = NvimTreeLineCondition,
	},
}
