return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    config = function()
        require('lualine').setup({
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { {
                    'diff',
                    colored = true,
                    symbols = { added = ' ', modified = ' ', removed = ' ' },
                } },
                lualine_c = { 'filename' },
                lualine_x = { 'diagnostics' },
                lualine_y = { 'branch' },
                lualine_z = { 'location' }
            },
        })
    end
}
