local project = require('project_nvim')

project.setup{
        manual_mode = false,
        detection_method = { 'lsp', 'pattern' },
        pattern = { '.git', 'package.json' },
        show_hidden = false,
        silent_chdir = false,
        datapath = vim.fn.stdpath('data')
}
