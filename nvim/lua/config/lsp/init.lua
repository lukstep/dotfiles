local lsp = load_plugin("lspconfig")
if not lsp then
    return
end

require("config.lsp.mason")
require("config.lsp.lspsaga")
require("config.lsp.handlers").setup()
require("config.lsp.cmp")
require("config.lsp.null_ls")
