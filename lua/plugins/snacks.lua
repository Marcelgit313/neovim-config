return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        dashboard = { example = "compact_files" },
        explorer = { enabled = false },
        indent = {
            indent = { char = "▏" },
            scope = { char = "▏" },
            animate = { enabled = false },
        },
        input = { enabled = false },
        picker = { enabled = false },
        notifier = { enabled = false },
        quickfile = { enabled = false },
        scope = { enabled = false },
        scroll = { enabled = false },
        statuscolumn = { enabled = false },
        words = { enabled = false },
    },
    keys = {
        { "<leader>h", function() Snacks.dashboard() end, desc = "Open Dashboard" }
    }
}
