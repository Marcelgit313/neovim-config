return {
    'vyfor/cord.nvim',
    config = function()
        require('cord').setup({
            display = {
                theme = 'default',
            },
        })
    end
}
