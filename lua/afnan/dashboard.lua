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


local plugins_count = vim.fn.len(vim.fn.globpath("~/.local/share/nvim/site/pack/packer/start", "*", 0, 1))
vim.g.dashboard_custom_footer = { " Loaded " .. plugins_count .. " Plugins" }
