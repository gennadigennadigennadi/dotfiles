return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        {
            "luukvbaal/statuscol.nvim",
            config = function()
                require("statuscol").setup(
                    {
                        foldfunc = "builtin",
                        setopt = true,
                        order = "SNsFs",
                        relculright = true
                    }
                )
            end
        }
    },
    event = "BufReadPost",
    opts = {},
    init = function()
        -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
        vim.keymap.set("n", "zR", function()
            require("ufo").openAllFolds()
        end)
        vim.keymap.set("n", "zM", function()
            require("ufo").closeAllFolds()
        end)
    end,
    config = function()
        require("ufo").setup({
            provider_selector = function()
                return { "treesitter", "indent" }
            end
        })
    end
}
