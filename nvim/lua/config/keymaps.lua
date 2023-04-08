local keymap = vim.keymap.set

-- Remap space as leader key
keymap("", "<Space>", "<Nop>")
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MOODE
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

-- COKELINE
keymap('n', '<S-Tab>', '<Plug>(cokeline-focus-prev)')    -- Prev buffer
keymap('n', '<Tab>', '<Plug>(cokeline-focus-next)')      -- Next buffer
keymap('n', '<Leader>p', '<Plug>(cokeline-switch-prev)') -- Move buffer left
keymap('n', '<Leader>n', '<Plug>(cokeline-switch-next)') -- Move buffer right
for i = 1, 9 do
    keymap('n', ('<Leader>%s'):format(i), ('<Plug>(cokeline-focus-%s)'):format(i))
end
keymap('n', ('<Leader>0'), ('<Plug>(cokeline-focus-10)'))

-- INSERT MODE
keymap("i", "jk", "<ESC>")

-- VISULA MODE
keymap("v", "c", "y") -- Copy
keymap("v", "x", "d") -- Cut
keymap("v", "v", "p") -- Past

-- VISUAL BLOCK
keymap("x", "c", "y")                   -- Copy
keymap("x", "x", "d")                   -- Cut
keymap("x", "v", "p")                   -- Past
keymap("x", "J", ":move '>+1<CR>gv-gv") -- Move block up
keymap("x", "K", ":move '<-2<CR>gv-gv") -- Move block down
