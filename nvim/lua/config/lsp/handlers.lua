
local handler = {}

handler.setup = function()
    local signs = {
        { name = "DiagnosticSignError", text = "" },
        { name = "DiagnosticSignWarn", text = "" },
        { name = "DiagnosticSignHint", text = "" },
        { name = "DiagnosticSignInfo", text = "" },
    }

    for _, sign in ipairs(signs) do
        vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
    end

    local config = {
        -- disable virtual text
        virtual_text = false,
        -- show signs
        signs = {
        active = signs,
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    }

    vim.diagnostic.config(config)

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_highlight_document(client)
    -- Set autocommands conditional on server_capabilities
    if client.server_capabilities.document_highlight then
        vim.cmd [[
            hi LspReferenceRead cterm=underline ctermbg=none gui=underline guibg=none
            hi LspReferenceText cterm=underline ctermbg=none gui=underline guibg=none
            hi LspReferenceWrite cterm=underline ctermbg=none gui=underline guibg=none
            hi link LspReferenceRead Folded
            hi link LspReferenceText Folded
            hi link LspReferenceWrite Folded
                ]]
        vim.api.nvim_exec([[
            augroup lsp_document_highlight
                autocmd! * <buffer>
                autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
                autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
            augroup END]], false)
    end
end

local function lsp_keymaps()
    -- vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", {buffer = 0})
    -- vim.keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", {buffer = 0})
    -- vim.keymap.set("n", "gf", "<cmd>Lspsaga lsp_finder<CR>", {buffer = 0})
    -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, {buffer = 0})
    -- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, {buffer = 0})
    -- vim.keymap.set("n", "gT", vim.lsp.buf.type_definition, {buffer = 0})
    -- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, {buffer = 0})
    -- vim.keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", {buffer = 0})
    -- vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, {buffer = 0})
    -- vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, {buffer = 0})
    -- vim.keymap.set("n", "<leader>dl", "<cmd>Telescope diagnostics<cr>", {buffer = 0})
    -- vim.keymap.set("n", "<leader>nm", "<cmd>lua vim.lsp.buf.rename()<cr>", {buffer = 0})
    -- vim.keymap.set("n", "gl", "<cmd>Lspsaga show_line_diagnostics<CR>", {buffer = 0})
    -- vim.keymap.set("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<cr>", {buffer = 0})
    -- vim.keymap.set("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", {buffer = 0})
    -- vim.keymap.set("n", "<cmd>lua vim.lsp.buf.format<cr>", "<leader>ff", {buffer = 0})
    vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

handler.on_attach = function(client, bufnr)
    lsp_keymaps()
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

handler.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return handler

