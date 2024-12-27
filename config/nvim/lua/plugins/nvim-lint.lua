return {
    "mfussenegger/nvim-lint",
    event = "VeryLazy",
    ft = { "php", "yaml" },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            php = { "php" },
            yaml = { "yamllint" },
            fish = { "fish" },
        }
    end,
}
