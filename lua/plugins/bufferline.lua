return {
    'akinsho/bufferline.nvim',
    version = "*",
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
        require("bufferline").setup({
            options = {
                diagnostics = "nvim_lsp",
                diagnostics_update_on_event = true,
                diagnostics_indicator = function(count, level)
                    local icon = level:match("error") and " " or " "
                    return " " .. icon .. count
                end,
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
