vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
	a = { description = { " New File               " }, command = "DashboardNewFile" },
	b = { description = { " Sessions               " }, command = "Telescope sessions" },
	c = { description = { " Find Files             " }, command = "Telescope find_files" },
	d = { description = { " Projects               " }, command = "Telescope projects" },
	e = { description = { " Update Plugins         " }, command = "PackerUpdate" },
	f = { description = { " Health Check           " }, command = "checkhealth" },
}
vim.g.dashboard_custom_footer = {}
