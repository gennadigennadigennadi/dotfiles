vim.o.background = "light"
-- require("onenord").setup {
--     borders = true, -- Split window borders
--     italics = {
--         comments = true, -- Italic comments
--         strings = false, -- Italic strings
--         keywords = false, -- Italic keywords
--         functions = false, -- Italic functions
--         variables = false, -- Italic variables
--     },
--     disable = {
--         background = false, -- Disable setting the background color
--         cursorline = false, -- Disable the cursorline
--         eob_lines = true, -- Hide the end-of-buffer lines
--     },
--     custom_highlights = {}, -- Overwrite default highlight groups
-- }

vim.g.sonokai_style = "andromeda"
vim.g.sonokai_enable_italic = true
vim.g.sonokai_show_eob = false
vim.g.sonokai_sign_column_background = false

vim.g.gruvbox_material_enable_italic = true

vim.g.edge_style = "aura"
vim.g.edge_enable_italic = true
vim.g.edge_show_eob = false

vim.g.everforest_show_eob = false
vim.g.everforest_enable_italic = true
vim.g.everforest_sign_column_background = false

vim.g.gruvbox_material_show_eob = false
vim.g.gruvbox_material_enable_italic = true
vim.g.gruvbox_material_sign_column_background = "none"

vim.cmd "colorscheme gruvbox-material"
