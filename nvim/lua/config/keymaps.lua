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
keymap("n", "<c-F>", "<cmd>Telescope grep_string<cr>")      -- Find all
keymap("n", "<leader>lg", "<cmd>Telescope live_grep<cr>")   -- Live grep
keymap("n", "<leader>t", "<cmd>Telescope buffers<cr>")      -- Switch buffers
keymap("n",  "<C-n>", "<cmd>:lua require('telescope.builtin').current_buffer_fuzzy_find({default_text=vim.fn.expand('<cword>')})<cr>")

-- BUFFERLINE
keymap("n", "<leader>1", "<Cmd>BufferLineGoToBuffer 1<CR>")  --Go to buffer 1
keymap("n", "<leader>2", "<Cmd>BufferLineGoToBuffer 2<CR>")  --Go to buffer 2
keymap("n", "<leader>3", "<Cmd>BufferLineGoToBuffer 3<CR>")  --Go to buffer 3
keymap("n", "<leader>4", "<Cmd>BufferLineGoToBuffer 4<CR>")  --Go to buffer 4
keymap("n", "<leader>5", "<Cmd>BufferLineGoToBuffer 5<CR>")  --Go to buffer 5
keymap("n", "<leader>6", "<Cmd>BufferLineGoToBuffer 6<CR>")  --Go to buffer 6
keymap("n", "<leader>7", "<Cmd>BufferLineGoToBuffer 7<CR>")  --Go to buffer 7
keymap("n", "<leader>8", "<Cmd>BufferLineGoToBuffer 8<CR>")  --Go to buffer 8
keymap("n", "<leader>9", "<Cmd>BufferLineGoToBuffer 9<CR>")  --Go to buffer 9
keymap("n", "<leader>0", "<Cmd>BufferLineGoToBuffer 10<CR>") --Go to buffer 9
keymap("n", "<leader>nn", "<cmd>BufferLineCycleNext<cr>")
keymap("n", "<leader>pp", "<cmd>BufferLineCyclePrev<cr>")

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

