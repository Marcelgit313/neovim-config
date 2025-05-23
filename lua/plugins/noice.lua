return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        cmdline = {
            enabled = false
        },
        routes = {
            {
                filter = { event = "notify", find = "No information available" },
                opts = { skip = true },
            },
        },
        messages = {
            enabled = false
        },
        health = {
            enabled = true
        }
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        "rcarriga/nvim-notify",
    },
}
