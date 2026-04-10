vim.api.nvim_create_user_command("Wbd", function(opts)
    local bufnr = tonumber(opts.args)
    if not bufnr or not vim.api.nvim_buf_is_valid(bufnr) then
        print("No valid Buffer Number")
        return
    end

    local buf = vim.bo[bufnr]
    local bufname = vim.api.nvim_buf_get_name(bufnr)

    if buf.modifiable and buf.buftype == "" and not bufname == "" then
        vim.api.nvim_buf_call(bufnr, function()
            vim.cmd("write")
        end)
    end

    vim.api.nvim_buf_delete(bufnr, {})
end, { nargs = 1 })
