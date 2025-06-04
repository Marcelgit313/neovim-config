return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                indicator = {
                    icon = '▎', -- this should be omitted if indicator style is not 'icon'
                    style = 'underline',
                },
                separator_style = "slope",
            },

        })

        vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>")
        vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>")
    end
}
