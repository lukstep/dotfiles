return {
    cmd = {
        "clangd",
        "--inlay-hints",
        "--background-index",
        "--suggest-missing-includes",
        "--completion-style=detailed",
        "-j=4",
        "--log=verbose"
    }
}
