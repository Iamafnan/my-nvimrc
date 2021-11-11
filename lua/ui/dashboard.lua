vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
	a = { description = { " New File               " }, command = "DashboardNewFile" },
	b = { description = { " Find Files             " }, command = "Telescope find_files" },
	c = { description = { " Projects               " }, command = "Telescope projects" },
	d = { description = { " Update Plugins         " }, command = "PackerUpdate" },
	e = { description = { " Health Check           " }, command = "checkhealth" },
}
