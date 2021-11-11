local g = vim.g

g.scrollview_excluded_filetypes = { "dashboard", "telescope" }
g.scrollview_on_startup = true
g.scrollview_refresh_time = 0
g.scrollview_winblend = 0

vim.cmd("highlight link ScrollView guibg='#ffffff' ")
