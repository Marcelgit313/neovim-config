return {
    {
        "mason-org/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        "mason-org/mason-lspconfig.nvim",
        config = function()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls", "ts_ls", "clangd"},
            })
        end
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            local lspconfig = require("lspconfig")
            local coq = require("coq")
            lspconfig.lua_ls.setup(coq.lsp_ensure_capabilities())
            lspconfig.ts_ls.setup(coq.lsp_ensure_capabilities())
            lspconfig.clangd.setup(coq.lsp_ensure_capabilities())
            vim.api.nvim_create_autocmd('LspAttach', {
                callback = function(ev)
                    local client = vim.lsp.get_client_by_id(ev.data.client_id)
                    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
                    vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
                    vim.keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, {})
                end
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                callback = function(args)
                    -- Get the detaching client
                    local client = vim.lsp.get_client_by_id(args.data.client_id)
                    -- Remove the autocommand to format the buffer on save, if it exists
                    if client:supports_method('textDocument/formatting') then
                        vim.api.nvim_clear_autocmds({
                            event = 'BufWritePre',
                            buffer = args.buf,
                        })
                    end
                end,
            })
        end
    },
}
