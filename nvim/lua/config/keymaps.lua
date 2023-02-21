local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MOODE
keymap("n", "+", "<C-a>")                                   -- Increment number
keymap("n", "-", "<C-x>")                                   -- Decrement number 
keymap("n", "<leader>cp", ":let @+ = expand('%:p')<CR>")    -- Copy path to file
keymap("n", "dw", 'vb"_d')                                  -- Delete word backwards
keymap("n", "<C-a>", 'gg<S-v>G')                            -- Select all
keymap("n", "<leader>q", '<CMD>BDelete this<cr>')

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h")
keymap("n", "<C-j>", "<C-w>j")
keymap("n", "<C-k>", "<C-w>k")
keymap("n", "<C-l>", "<C-w>l")

-- TELESCOPE
keymap("n", "<c-p>", "<cmd>Telescope find_files<cr>")       -- Find files
-- keymap("n", "<c-f>", "<cmd>Telescope current_buffer_fuzzy_find<cr>")      -- Find all
g_expand = function ()
    return '"' .. vim.fn.expand('<cword>') .. '"'
end
keymap("n", "<leader>lg", ':lua require("telescope").extensions.live_grep_args.live_grep_args()<cr>')   -- Live grep
keymap("n", "<c-f>", ':lua require("telescope").extensions.live_grep_args.live_grep_args({default_text=g_expand()})<cr>')   -- Live grep
keymap("n", "<leader>t", "<cmd>Telescope buffers<cr>")      -- Switch buffers
keymap("n",  "<C-n>", "<cmd>:lua require('telescope.builtin').current_buffer_fuzzy_find({default_text=vim.fn.expand('<cword>')})<cr>")

-- TERMINAL
function _G.set_terminal_keymaps()
  keymap('t', '<esc>', [[<C-\><C-n>]])                      -- Exit insert mode in terminal
  keymap('t', 'jk', [[<C-\><C-n>]])                         -- Exit insert mode in terminal
  keymap('t', '<C-h>', [[<C-\><C-n><C-W>h]])
  keymap('t', '<C-j>', [[<C-\><C-n><C-W>j]])
  keymap('t', '<C-k>', [[<C-\><C-n><C-W>k]])
  keymap('t', '<C-l>', [[<C-\><C-n><C-W>l]])
end
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
keymap("n", "<leader>tg", "<cmd>lua _TIG_TOGGLE()<cr>")
keymap("n", "<leader>py", "<cmd>lua _PYTHON_TOGGLE()<cr>")

-- COKELINE
keymap('n', '<S-Tab>',   '<Plug>(cokeline-focus-prev)')
keymap('n', '<Tab>',     '<Plug>(cokeline-focus-next)')
keymap('n', '<Leader>p', '<Plug>(cokeline-switch-prev)')
keymap('n', '<Leader>n', '<Plug>(cokeline-switch-next)')
for i = 1,9 do
  keymap('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i))
end
keymap('n', ('<Leader>0'), ('<Plug>(cokeline-focus-10)'))

-- NVIM-TREE
keymap("n", "<leader>e", "<cmd>NvimTreeToggle<cr>")

-- GIT
keymap('n', 'cc', '<Plug>(git-conflict-ours)')              -- Conflict, get current
keymap('n', 'ci', '<Plug>(git-conflict-theirs)')            -- Conflict, get inclomming
keymap('n', 'cb', '<Plug>(git-conflict-both)')              -- Conflict, get both
keymap('n', 'c0', '<Plug>(git-conflict-none)')              -- Conflict, get none
keymap('n', ']x', '<Plug>(git-conflict-prev-conflict)')     -- Go to prev conflict
keymap('n', '[x', '<Plug>(git-conflict-next-conflict)')     -- Go to next conflict
keymap('n', "<leader>gc", "<cmd>GitConflictListQf<cr>")     -- Show all conflicts
keymap('n', "<leader>gs", "<cmd>Telescope git_status<cr>")  -- Show git status


-- INSERT MODE
keymap("i", "jk", "<ESC>")

-- VISULA MODE
keymap("v", "c", "y")                                       -- Copy
keymap("v", "x", "d")                                       -- Cut
keymap("v", "v", "p")                                       -- Past

-- VISUAL BLOCK
keymap("x", "c", "y")                                       -- Copy
keymap("x", "x", "d")                                       -- Cut 
keymap("x", "v", "p")                                       -- Past
keymap("x", "J", ":move '>+1<CR>gv-gv")                     -- Move block up
keymap("x", "K", ":move '<-2<CR>gv-gv")                     -- Move block down

