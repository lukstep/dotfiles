local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    vim.notify("Lspconfig not found!" , "error", { title = "Start-up" })
end

require("config.lsp.mason")
require("config.lsp.lspsaga")
require("config.lsp.handlers").setup()
require("config.lsp.cmp")
require("config.lsp.null_ls")
