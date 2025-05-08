return {
    "MagicDuck/grug-far.nvim",
    opts = {},
    keys = {
        {
            "<leader>S",
            function() require("grug-far").open() end,
        },
    },
}
