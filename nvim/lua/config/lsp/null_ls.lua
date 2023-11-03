local null_ls = load_plugin("null-ls")
if not null_ls then
    return
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
