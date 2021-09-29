local actions = require('telescope.actions')
local config = {
        defaults = {
                mappings = {
                        n = {
                                ['q'] = actions.close
                        },
                },
        },
}
require('telescope').setup(config)
