local present, treesitter = pcall(require, "nvim-treesitter.configs")
if not present then
    vim.notify("Treesitter not found!", "error", { title = "Start-up" })
    return
end

treesitter.setup({
    ensure_installed = {
        "c",
        "cpp",
        "python",
        "cmake",
        "rust",
        "dockerfile",
        "diff",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "html",
        "json",
        "latex",
        "markdown",
        "make",
        "regex",
        "toml",
        "vim",
        "bash"
    },
    auto_install = true,
    highlight = {
        disable = function(lang, buf)
            local max_filesize = 300 * 1024 -- 300 KB
            local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
            if ok and stats and stats.size > max_filesize then
                return true
            end
        end,
    aditional_vim_regex_highlighting = false,
    },
    indent = { enable = false, disable = { "" } },
    context_commentstring = {
        enble = true,
        enable_autocmd = false
    }
})

