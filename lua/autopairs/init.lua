local npairs = require('nvim-autopairs')

npairs.setup({
        break_line_filetype = nil,
        check_ts = true
})

require("nvim-autopairs.completion.cmp").setup({
        map_cr = true,
        map_complete = true,
        auto_select = true,
        insert = false,
        map_char = {
            all = '(',
            tex = '{'
        }
    })
