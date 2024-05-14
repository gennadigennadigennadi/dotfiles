return {
    "kristijanhusak/vim-dadbod-ui",
    keys = {
        { "<leader>D", "<cmd>DBUIToggle<Cr>", desc = "Toggle vim-dadbod-ui" },
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    dependencies = {
        { "tpope/vim-dadbod" },
        { "kristijanhusak/vim-dadbod-completion", ft = { "sql", "mysql", "plsql" } },
    },
    config = function() end,
    init = function()
        -- Your DBUI configuration
        vim.g.db_ui_use_nerd_fonts = 1
        vim.g.db_ui_auto_execute_table_helpers = 1
        vim.g.db_ui_use_nvim_notify = 1
    end,
}
