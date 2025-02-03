return {
    "echasnovski/mini.splitjoin",
    version = false,
    keys = {
        {
            "gS",
            function()
                require("mini.splitjoin").toggle()
            end,
            desc = "Split/join arrays, argument lists, etc. from one vs. multiline and vice versa",
        },
    },
    opts = {},
}
