local status_ok, autopairs = pcall(require, "nvim-autopairs")
if not status_ok then
    vim.notify("Autopairs not found!", "error", { title = "Start-up" })
    return
end

autopairs.setup({
    check_ts = true,
    ts_config = {
        lua = { 'string' }, -- it will not add a pair on that treesitter node
        javascript = { 'template_string' },
        java = false,     -- don't check treesitter on java
    },
})

local ts_conds = require('nvim-autopairs.ts-conds')
