local saga = require('lspsaga')

saga.init_lsp_saga{
        code_action_keys = {
  quit = 'q',exec = '<CR>'
},
        rename_action_keys = {
  quit = '<ESC>' ,exec = '<CR>'
},
        dianostic_header_icon = '   ',
        -- code_action_icon = '  ',
        code_action_prompt = {
        enable = true,
        sign = true,
        sign_priority = 20,
        virtual_text = true,
},
        rename_prompt_prefix = '➜',

}
