local status_ok, wk = pcall(require, "which-key")
if not status_ok then
    vim.notify("Which-key can't be found", "error", { title = "Start-up" })
    return
end

local g_expand = function()
    return '"' .. vim.fn.expand('<cword>') .. '"'
end

wk.setup({
    ignore_missing = true,
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "",
    },
})

wk.register({
    ["<leader>"] = {
        -- keymap('n', '<Leader>p', '<Plug>(cokeline-switch-prev)')    -- Move buffer left
        -- keymap('n', '<Leader>n', '<Plug>(cokeline-switch-next)')    -- Move buffer right
        -- for i = 1,9 do
        --   keymap('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i))
        -- end
        d = {
            name = " Diagnostic",
            n = { ":lua vim.diagnostic.goto_next()<cr>", "Next diagnostic" },
            p = { ":lua vim.diagnostic.goto_prev()<cr>", "Prev diagnostic" },
            t = { "<cmd>Telescope diagnostics<cr>", "List" },
            l = { "<cmd>Lspsaga show_line_diagnostics<CR>", "Peek diagnostic" },
        },
        c = {
            name = "󰆏 Copy",
            n = { "<cmd>FileName<cr>", "Copy file name" },
            p = { "<cmd>FileRelativePath<cr>", "Copy file path" },
            P = { "<cmd>FileAbsolutePath<cr>", "Copy file full path" }
        },
        e = { "<cmd>NvimTreeToggle<cr>", "File explorer" },
        f = {
            name = " Find",
            b = { "<cmd>Telescope buffers<cr>", "Find buffer" },
            B = { "<cmd>lua TelescopeFindWordInBuild(vim.fn.expand('<cword>'))<cr>", "Find in build" },
            g = { "<cmd>lua TelescopeFindWordWitoutIgnore(vim.fn.expand('<cword>'))<cr>", "Find include ignore" },
            f = { "<cmd>Telescope find_files<cr>", "Find file" },
            F = { "<cmd>lua TelescopeFindWordInFolder('', vim.fn.expand('<cword>'))<cr>", "Find in folder" },
            j = { "<cmd>lua TelescopeFindWordInJava(vim.fn.expand('<cword>'))<cr>", "Find in Java files" },
            w = { "<cmd>lua TelescopeFindWord(vim.fn.expand('<cword>'))<cr>", "Find word" },
            W = {
                "<cmd>:lua require('telescope.builtin').current_buffer_fuzzy_find({default_text=vim.fn.expand('<cword>')})<cr>",
                "Find word in file" },
            t = { "<cmd>lua TelescopeFindWordInFolder(vim.fn.expand('<cword>'), 'test*')<cr>", "Find in test" }
        },
        g = {
            name = " Git",
            s = { "<cmd>Telescope git_status<cr>", "Git status" },
            c = {
                name = "+Git conflicts",
                l = { "<cmd>GitConflictListQf<cr>", "Conflicts list" },
                c = { "<Plug>(git-conflict-ours)", "Get current" },
                i = { "<Plug>(git-conflict-theirs)", "Get inclomming" },
                b = { "<Plug>(git-conflict-both)", "Get both" },
                N = { "<Plug>(git-conflict-none)", "Get none" },
                p = { "<Plug>(git-conflict-prev-conflict)", "Go prev" },
                n = { "<Plug>(git-conflict-next-conflict)", "Go next" }
            },
            v = { "<cmd>DiffviewFileHistory %<cr>", "Show current file diff"}
        },
        l = {
            name = " LSP",
            a = { "<cmd>Lspsaga code_action<cr>", "Code action" },
            d = { ":lua vim.lsp.buf.definition()<cr>", "Go to definition" },
            D = { ":lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
            f = { "<cmd>lua vim.lsp.buf.format()<cr>", "File formating" },
            i = { ":lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
            k = { "<cmd>Lspsaga hover_doc<cr>", "Documentation" },
            r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename symbol" },
            R = { "<cmd>Telescope lsp_references<cr>", "Reference list" },
            -- vim.keymap.set("n", "pd", "<cmd>Lspsaga peek_definition<CR>", {buffer = 0})
            s = { "<cmd>Lspsaga lsp_finder<CR>", "LSP finder" },
            t = { ":lua vim.lsp.buf.type_definition()<cr>", "Type definition" },
            w = { ":%s/\\s\\+$//e<cr>", "Trim trailing whitespace" },
        },
        t = {
            name = " Terminal",
            g = { "<cmd>lua _TIG_TOGGLE()<cr>", "Toggle Tig terminal" },
            p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Toggle Python terminal" },
            t = { "<cmd>ToggleTerm()<cr>", "Toggle Terminal" }
        },
        q = { "<CMD>BDelete this<cr>", "Close current buffer" }

    }
})
