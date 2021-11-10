vim.g.dashboard_default_executive = "telescope"
vim.g.dashboard_custom_section = {
	a = { description = { " Find Files             " }, command = "Telescope find_files" },
	b = { description = { " Projects               " }, command = "Telescope projects" },
	c = { description = { " Configuration          " }, command = "edit ~/.config/nvim/init.lua" },
	d = { description = { " Update Plugins         " }, command = "PackerUpdate" },
	e = { description = { " Health Check           " }, command = "checkhealth" },
}
