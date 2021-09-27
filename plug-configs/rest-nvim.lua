local rest = require 'rest-nvim'
local config = {
        result_split_horizontal = false,
        skip_ssl_verification = false,
        highlight = {
        enabled = true,
        timeout = 150,
      },
      jump_to_request = false
}

rest.setup(config)
