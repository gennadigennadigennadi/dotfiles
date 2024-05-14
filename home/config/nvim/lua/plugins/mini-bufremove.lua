return {
    "echasnovski/mini.bufremove",
    version = "*",
    keys = {
        {
            "<leader>q",
            function()
                require("mini.bufremove").delete(0, false)
            end,
            desc = "Delete Buffer",
        },
    },
    opts = {},
}
