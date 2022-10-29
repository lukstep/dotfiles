local keymap = vim.keymap.set 

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- NORMAL MOODE
keymap("n", "+", "<C-a>")                                   -- Increment number
keymap("n", "-", "<C-x>")                                   -- Decrement number 
keymap("n", "<leader>cp", ":let @+ = expand('%:p')<CR>")    -- Copy path to file
keymap("n", "dw", 'vb"_d')                                  -- Delete word backwards
keymap("n", "<C-a>", 'gg<S-v>G')                            -- Select all

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

