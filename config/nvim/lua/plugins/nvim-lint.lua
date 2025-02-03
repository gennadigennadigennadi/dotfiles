return {
    "mfussenegger/nvim-lint",
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
