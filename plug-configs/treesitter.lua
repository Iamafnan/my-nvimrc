require 'nvim-treesitter.configs'.setup{
        highlight = {
                enable = true,
        },
        indent = {
                enable = true,
        },
        ensure_installed = {
                'json',
                'html',
                'css',
                'javascript',
                'typescript',
                'lua',
                'vim',
                'python'
        }
}
