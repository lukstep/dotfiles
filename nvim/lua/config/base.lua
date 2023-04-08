local options = {
    backup = false, -- Disable backup
    background = 'dark',
    backspace = 'start,eol,indent',
    clipboard = 'unnamedplus',            -- Allow Nvim to use system clipboard
    completeopt = { "menu", "noselect" }, -- For CMP
    conceallevel = 0,                     -- So that `` is visible in Markdown files
    cursorline = true,                    -- Highlight the current line
    expandtab = true,                     -- Converts tabs into spaces
    fileencoding = 'utf-8',               -- Files encoding
    guifont = "monospace:h17",            -- the font used in graphical neovim applications
    hlsearch = true,                      -- Highlight all matches on previous search pattern
    ignorecase = true,                    -- Ignore case in search patterns
    mouse = 'a',                          -- Allow the mouse to be used in Neovim
    mousemodel = 'popup',                 -- Pop up mouse model
    number = true,                        -- Show lines numbers
    numberwidth = 2,                      -- Set number column width to 2
    pumblend = 5,
    pumheight = 10,                       -- Pop up menu height
    showmode = false,                     -- Disable showing current using mode
    relativenumber = true,                -- Relative numbers
    signcolumn = "yes",                   -- always show the sign column, otherwise it would shift the text each time
    sidescrolloff = 20,
    scrolloff = 20,
    showtabline = 2,        -- Always show tabs
    smartcase = true,       -- Smart case
    smartindent = true,     -- Smart indent
    spell = true,           -- Enable spell check
    spelllang = 'en_us', -- Spell checker lang
    splitbelow = true,      -- force all horizontal splits to go below current window
    splitright = true,      -- force all vertical splits to go to the right of current window
    swapfile = false,       -- Creates a swap files
    shiftwidth = 4,         -- the number of spaces inserted for each indentation
    tabstop = 4,
    termguicolors = true,   -- Set term GUI colors
    timeoutlen = 1000,      -- Time to wait for mapped sequence to complete (in ms)
    undofile = true,        -- Enable persistent undo
    undolevels = 500,       -- Number of changes can be undo
    updatetime = 400,       -- Faster completion (4000ms default)
    wildoptions = 'pum',
    winblend = 0,
    wrap = false, -- display lines as one long line
}

for key, value in pairs(options) do
    vim.opt[key] = value
end

vim.api.nvim_create_user_command("FileName", function()
    local path = vim.fn.expand("%:t")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '"')
end, {})

vim.api.nvim_create_user_command("FileRelativePath", function()
    local path = vim.fn.expand("%")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '"')
end, {})

vim.api.nvim_create_user_command("FileAbsolutePath", function()
    local path = vim.fn.expand("%:p")
    vim.fn.setreg("+", path)
    vim.notify('Copied "' .. path .. '"')
end, {})
