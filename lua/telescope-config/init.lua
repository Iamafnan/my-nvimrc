local load = require("telescope").load_extension

require("telescope-config.config")
require("telescope-config.extentions")

-- Extentions
load("projects")
load("neoclip")
load("sessions")
load("notify")
