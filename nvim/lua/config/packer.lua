local fn = vim.fn

-- Automatic"neovim/nvim-lspconfig"ally install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the packer.lua file
vim.cmd [[
    augroup packer_user_config
        autocmd!
        autocmd BufWritePost packer.lua source <afile> | PackerSync
    augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init {
    display = {
        open_fn = function()
            return require("packer.util").float { border = "rounded" }
        end,
    },
}

-- Install your plugins here
return packer.startup(function(use)
    -- Colors
    use "cpea2506/one_monokai.nvim"

    -- IDE
    use {
        'nvim-telescope/telescope.nvim',
        requires = { { 'nvim-lua/plenary.nvim',
            { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
            'nvim-telescope/telescope-live-grep-args.nvim' } },
    }
    use "noib3/nvim-cokeline"
    use 'kazhala/close-buffers.nvim'
    use "kyazdani42/nvim-web-devicons"
    use {
        "nvim-tree/nvim-tree.lua",
        requires = {
            "nvim-tree/nvim-web-devicons",
        },
        tag = "nightly"
    }
    use "goolord/alpha-nvim"
    use "rcarriga/nvim-notify"
    use "numToStr/Comment.nvim"
    use "arkav/lualine-lsp-progress"
    use "nvim-lualine/lualine.nvim"
    use "akinsho/toggleterm.nvim"
    use "nvim-zh/colorful-winsep.nvim"
    use "lukas-reineke/indent-blankline.nvim"
    use "willothy/flatten.nvim"
    use "folke/which-key.nvim"

    -- GIT
    use "lewis6991/gitsigns.nvim"
    use "akinsho/git-conflict.nvim"
    use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }
    -- LSP
    use {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "neovim/nvim-lspconfig",
        "glepnir/lspsaga.nvim"
    }
    use "saadparwaiz1/cmp_luasnip"
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "L3MON4D3/LuaSnip"
    use "rafamadriz/friendly-snippets"
    use "nvim-treesitter/nvim-treesitter"
    use "jose-elias-alvarez/null-ls.nvim"
    use "windwp/nvim-autopairs"
    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
        require("packer").sync()
    end
end)
