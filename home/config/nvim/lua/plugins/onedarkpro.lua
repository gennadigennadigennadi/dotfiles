return {
    "olimorris/onedarkpro.nvim",
    priority = 1000, -- Ensure it loads first,
    enabled = true,
    config = function()
        require("onedarkpro").setup({
            styles = { -- For example, to apply bold and italic, use "bold,italic"
                types = "NONE", -- Style that is applied to types
                methods = "NONE", -- Style that is applied to methods
                numbers = "NONE", -- Style that is applied to numbers
                strings = "NONE", -- Style that is applied to strings
                comments = "italic", -- Style that is applied to comments
                keywords = "bold", -- Style that is applied to keywords
                constants = "NONE", -- Style that is applied to constants
                functions = "bold", -- Style that is applied to functions
                operators = "NONE", -- Style that is applied to operators
                variables = "NONE", -- Style that is applied to variables
                parameters = "NONE", -- Style that is applied to parameters
                conditionals = "NONE", -- Style that is applied to conditionals
                virtual_text = "NONE", -- Style that is applied to virtual text
            },
        })

        vim.cmd("colorscheme onelight")
    end,
}
