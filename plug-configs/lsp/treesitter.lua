require 'nvim-treesitter.configs'.setup{
        highlight = {
                enable = true,
                disable = {}
        },
        indent = {
                enable = true,
                disable = {}
        },
        ensure_installed = {
                'tsx',
                'toml',
                'json',
                'html',
                'scss',
                'css'
        }
}
