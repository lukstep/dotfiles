local treesitter = load_plugin("nvim-treesitter.configs")
if not treesitter then
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
        enable = true,
    },
    indent = { enable = false, disable = { "" } },
    context_commentstring = {
        enble = true,
        enable_autocmd = false
    }
})
