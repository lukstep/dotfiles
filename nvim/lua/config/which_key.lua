local wk = load_plugin("which-key")
if not wk then
    return
end

local g_expand = function()
    return '"' .. vim.fn.expand('<cword>') .. '"'
end

local keymap = vim.keymap.set

wk.setup({
    -- ignore_missing = true,
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "",
    },
    presets = {
        motion = true
    },
    window = {
        border = "single",
    }
})


-- Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

keymap("n", "+", "<C-a>")        -- Increment number
keymap("n", "-", "<C-x>")        -- Decrement number
keymap("n", "dw", 'vb"_d')       -- Delete word backwards
keymap("n", "<C-a>", 'gg<S-v>G') -- Select all

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- TERMINAL
function _G.set_terminal_keymaps()
    keymap('t', '<esc>', [[<C-\><C-n>]]) -- Exit insert mode in terminal
    keymap('t', 'jk', [[<C-\><C-n>]])  -- Exit insert mode in terminal
    keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]])
    keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]])
    keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]])
    keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]])
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

keymap("i", "jk", "<ESC>") -- Switch to normal mode

keymap("v", "c", "y") -- Copy
keymap("v", "x", "d") -- Cut
keymap("v", "v", "p") -- Past

keymap("x", "c", "y")                   -- Copy
keymap("x", "x", "d")                   -- Cut
keymap("x", "v", "p")                   -- Past
keymap("x", "J", ":move '>+1<CR>gv-gv") -- Move block up
keymap("x", "K", ":move '<-2<CR>gv-gv") -- Move block down

wk.register({
    ["<leader>"] = {
        ["1"] = { "<Plug>(cokeline-focus-1)", "Go to tab number 1" },
        ["2"] = { "<Plug>(cokeline-focus-2)", "Go to tab number 2" },
        ["3"] = { "<Plug>(cokeline-focus-3)", "Go to tab number 3" },
        ["4"] = { "<Plug>(cokeline-focus-4)", "Go to tab number 4" },
        ["5"] = { "<Plug>(cokeline-focus-5)", "Go to tab number 5" },
        ["6"] = { "<Plug>(cokeline-focus-6)", "Go to tab number 6" },
        ["7"] = { "<Plug>(cokeline-focus-7)", "Go to tab number 7" },
        ["8"] = { "<Plug>(cokeline-focus-8)", "Go to tab number 8" },
        ["9"] = { "<Plug>(cokeline-focus-9)", "Go to tab number 9" },
        ["0"] = { "<Plug>(cokeline-focus-10)", "Go to tab number 10" },
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
            v = { "<cmd>DiffviewFileHistory %<cr>", "Show current file diff" }
        },
        h = {
            name = " Harpoon/Bookmarks",
            h = { ":Telescope harpoon marks<cr>", "List" },
            c = { ":lua require('harpoon.mark').clear_all()<cr>", "Clear all bookmarks" },
            t = { ":lua require('harpoon.mark').add_file()<cr>", "Add bookmark" },
        },
        l = {
            name = " LSP",
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
        n = { "<Plug>(cokeline-switch-prev)" , "Move tab left"},
        p = { "<Plug>(cokeline-switch-next)", "Move tab right"},
        t = {
            name = " Terminal",
            g = { "<cmd>lua _TIG_TOGGLE()<cr>", "Toggle Tig terminal" },
            p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Toggle Python terminal" },
            t = { "<cmd>ToggleTerm()<cr>", "Toggle Terminal" }
        },
        q = { "<CMD>BDelete this<cr>", "Close current buffer" },
    },
    ["<S-Tab>"]  = { "<Plug>(cokeline-focus-prev)", "Prev buffer" },
    ["<Tab>"] = { "<Plug>(cokeline-focus-next)",    "Next buffer" },
})


