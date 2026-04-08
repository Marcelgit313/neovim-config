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
				ensure_installed = { "lua_ls", "ts_ls", "gopls" },
			})
		end
	},
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			--------------------------------------------------
			-- Diagnostics
			--------------------------------------------------
			local signs = {
				Error = " ",
				Warn  = " ",
				Hint  = "󰠠 ",
				Info  = " ",
			}

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			vim.diagnostic.config({
				virtual_text = true,
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
			})

			--------------------------------------------------
			-- LspAttach (Keymaps + Format)
			--------------------------------------------------
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),
				callback = function(ev)
					local opts = { buffer = ev.buf }

					-- Navigation
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)

					-- Actions
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Signature Help (IN Funktionen)
					vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)

					-- Format on save (nur wenn unterstützt)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					if client and client.supports_method("textDocument/formatting") then
						vim.api.nvim_create_autocmd("BufWritePre", {
							buffer = ev.buf,
							callback = function()
								vim.lsp.buf.format({ bufnr = ev.buf, timeout_ms = 1000 })
							end,
						})
					end
				end,
			})

			--------------------------------------------------
			-- Capabilities (für nvim-cmp)
			--------------------------------------------------
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			--------------------------------------------------
			-- Server Setup
			--------------------------------------------------
			local lspconfig = require("lspconfig")

			-- Lua
			vim.lsp.config("lua_ls", {
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = { globals = { "vim" } },
						workspace = { checkThirdParty = false },
						telemetry = { enable = false },
					},
				},
			})

			-- TypeScript / JavaScript
			vim.lsp.config("ts_ls", {
				capabilities = capabilities,
			})

			-- Go
			vim.lsp.config("gopls", {
				capabilities = capabilities,
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
						},
						staticcheck = true,
					},
				},
			})
		end,
	}

}
