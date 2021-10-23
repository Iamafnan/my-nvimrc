local project = require('project_nvim')

project.setup{
        manual_mode = false,
        detection_method = { 'lsp', 'pattern' },
        update_cwd = true,
        pattern = { '.git', 'package.json' },
        show_hidden = true,
        silent_chdir = true,
        datapath = vim.fn.stdpath('data'),
        exclude_dirs = {'./node_modules/*'},
}
