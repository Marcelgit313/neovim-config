return {
    "stevearc/oil.nvim",
    opts = {},
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("oil").setup({
            default_file_explorer = true,
            delete_to_trash = true,
            skip_confirm_for_simple_edits = true,
            view_options = {
                show_hidden = true,
                natural_order = true,
            },
            float = {
                padding = 2,
                max_width = 90,
                max_height = 0,
            },
            win_options = {
                wrap = true,
                winblend = 0,
            },
            keymap = {
                ["<C-h>"] = false,
                ["<C-c>"] = false,
                ["<M-h>"] = "actions.select_split",
                ["<q>"] = "actions.close"
            }
        })

        vim.keymap.set("n", "-", "<CMD>Oil<CR>")
        vim.keymap.set("n", "<leader>-", require("oil").toggle_float)
    end,
}
