local black = "#282a36"
local black2 = "#44475a"
local black3 = "#242630"
local white = "#f8f8f2"
local comment_color = "#6272a4"
local cyan = "#8be9fd"
local green = "#50fa7b"
local orange = "#ffb86c"
local pink = "#ff79c6"
local purple = "#bd93f9"
local red = "#ff5555"
local yellow = "#f1fa8c"

function bg(group, color)
	vim.cmd("hi " .. group .. " guibg= " .. color)
end

function fg(group, color)
	vim.cmd("hi " .. group .. " guifg= " .. color)
end

-- Cursor line
fg("cursorlinenr", purple)

-- Completion Menu
bg("PmenuSel", black2)
bg("Pmenu", black3)
