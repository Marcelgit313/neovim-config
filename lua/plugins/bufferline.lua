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

        vim.keymap.set("n", "<leader>bp", ":BufferLinePick<CR>")
        vim.keymap.set("n", "<leader>bc", ":BufferLinePickClose<CR>")
        vim.keymap.set("n", "<leader>nb", ":BufferLineCyclePrev<CR>")
        vim.keymap.set("n", "<leader>pb", ":BufferLineCycleNext<CR>")
    end
}
