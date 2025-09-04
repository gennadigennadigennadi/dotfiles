-- Language parser tool to power faster and more accurrate syntax highlighting
vim.pack.add({
    { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "master" },
    { src = "https://github.com/David-Kunz/markid.git" },
})


local m = require("markid")
m.queries = {
    default = "(identifier) @markid",
    php = [[
        (variable_name) @markid
        (member_access_expression) @markid
    ]],
}

local colors = m.colors.dark

require("nvim-treesitter.configs").setup({
    markid = {
        enable = true,
        colors = colors,
        queries = m.queries,
    },
})

require("nvim-treesitter.configs").setup({
    auto_install = true,
    highlight = { enable = true },
    indent = { enable = true },
    ensure_installed = {
        "bash",
        "css",
        "csv",
        "dockerfile",
        "editorconfig",
        "git_config",
        "git_rebase",
        "gitcommit",
        "gitignore",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "mermaid",
        "scss",
        "toml",
        "typescript",
        "yaml",
        "php",
        "twig"
    },
})

-- Whenever upgrading the plugin, also run :TSUpdate to upgrade all parsers
vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Handle nvim-treesitter updates",
    group = vim.api.nvim_create_augroup("nvim-treesitter-pack-changed-update-handler", { clear = true }),
    callback = function(event)
        if event.data.kind == "update" then
            vim.notify("nvim-treesitter updated, running TSUpdate...", vim.log.levels.INFO)
            local ok = pcall(vim.cmd, "TSUpdate")
            if ok then
                vim.notify("TSUpdate completed successfully!", vim.log.levels.INFO)
            else
                vim.notify("TSUpdate command not available yet, skipping", vim.log.levels.WARN)
            end
        end
    end,
})
