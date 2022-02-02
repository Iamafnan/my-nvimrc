vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_disable_statusline = 1
vim.g.dashboard_custom_header = {
	[[                                                     ]],
	[[                                                     ]],
	[[                                                     ]],
	[[  ███▄    █ ▓█████  ▒█████   ██▒   █▓ ██▓ ███▄ ▄███▓ ]],
	[[  ██ ▀█   █ ▓█   ▀ ▒██▒  ██▒▓██░   █▒▓██▒▓██▒▀█▀ ██▒ ]],
	[[ ▓██  ▀█ ██▒▒███   ▒██░  ██▒ ▓██  █▒░▒██▒▓██    ▓██░ ]],
	[[ ▓██▒  ▐▌██▒▒▓█  ▄ ▒██   ██░  ▒██ █░░░██░▒██    ▒██  ]],
	[[ ▒██░   ▓██░░▒████▒░ ████▓▒░   ▒▀█░  ░██░▒██▒   ░██▒ ]],
	[[ ░ ▒░   ▒ ▒ ░░ ▒░ ░░ ▒░▒░▒░    ░ ▐░  ░▓  ░ ▒░   ░  ░ ]],
	[[ ░ ░░   ░ ▒░ ░ ░  ░  ░ ▒ ▒░    ░ ░░   ▒ ░░  ░      ░ ]],
	[[    ░   ░ ░    ░   ░ ░ ░ ▒       ░░   ▒ ░░      ░    ]],
	[[          ░    ░  ░    ░ ░        ░   ░         ░    ]],
	[[                                 ░                   ]],
	[[                                                     ]],
	[[                                                     ]],
}
vim.g.dashboard_custom_section = {
	a = { description = { " New File   " }, command = "DashboardNewFile" },
	b = { description = { " Find Files " }, command = "Telescope find_files" },
	c = { description = { " History    " }, command = "DashboardFindHistory" },
	d = { description = { " Colorscheme" }, command = "Telescope colorscheme" },
}
vim.g.dashboard_custom_footer = {}
