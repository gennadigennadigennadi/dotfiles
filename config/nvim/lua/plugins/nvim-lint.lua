return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            php = { "php" },
            yaml = { "yamllint" },
        }

    end,
}
