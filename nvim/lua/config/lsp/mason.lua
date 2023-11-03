local mason = load_plugin("mason")
if not mason then
    return
end

mason.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

local mason_lspconfig = load_plugin("mason-lspconfig")
if not mason_lspconfig then
    return
end

mason_lspconfig.setup({
    ensure_installed = {
        "clangd",
        "cmake",
        "pylsp",
    }
})

mason_lspconfig.setup_handlers({
    function(server_name)
        local server_config_path = "config.lsp.servers." .. server_name
        local is_default_config, default_server_config = pcall(require, server_config_path)
        local opts = {
            on_attach = require("config.lsp.handlers").on_attach,
            capabilities = require("config.lsp.handlers").capabilities
        }
        if is_default_config then
            opts = vim.tbl_deep_extend("force", default_server_config, opts)
            require("lspconfig")[server_name].setup(opts)
        else
            require("lspconfig")[server_name].setup(opts)
            vim.notify({ server_name .. " config not found!" }, "warn", { title = "LSP" })
        end
    end
})
