local status_ok, null_ls = pcall(require, "null-ls")
if not status_ok then
    vim.notify("Null-ls not found!" , "error", { title = "LSP" })
end

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
    debug = false,
    source = {
        formatting.black.with { extra_args = { "--fast" } },
        diagnostics.flake8
    }
})
