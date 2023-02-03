local M = {
    "folke/which-key.nvim",
    event = "BufReadPre",
}

function M.config()
    local wk = require "which-key"

    wk.setup { plugins = { spelling = { enabled = true } } }

    wk.register({
        q = { "<cmd>bp<bar>bd #<CR>", "close buffer" },
        x = { "<cmd>q!<cr>", "Exit" },
        s = { "<cmd>w!<cr>", "Save" },
        W = { "<cmd>wqa!<cr>", "Write and quit" },
        b = { name = "+buffer", e = "sort-extension", d = "sort-directory", l = "next", h = "prev", q = "quit" },
        h = { name = "+gitsign", b = "blame", s = "stage hunk" },
        t = {
            name = "+toggle",
            t = { "<cmd>ToggleTerm<cr>", "Term" },
            s = { "<cmd>Alpha<cr>", "Alpha" },
            n = { "<cmd>NvimTreeToggle<CR>", "NvimTree" },
            f = { "<cmd>NvimTreeFindFileToggle<CR>", "NvimTree" },
            d = { "<cmd>lua require('dapui').toggle()<cr>", "DAPui" },
            -- o = { "<cmd>Vista!!<cr>", "Vista" },
            x = { "<cmd>TroubleToggle lsp_references<cr>", "Trouble" },
        },
        d = {
            name = "+dap",
            b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "add breakpoint" },
            d = { "<cmd>lua require'dap'.continue()<CR>", "debug" },
            n = { "<cmd>lua require'dap'.step_over()<CR>", "step_over" },
            i = { "<cmd>lua require'dap'.step_into()<CR>", "step_into" },
            o = { "<cmd>lua require'dap'.step_out()<CR>", "step_out" },
            k = { "<cmd>lua require'dap.ui.widgets'.hover()<CR>", "hover" },
            q = { "<cmd>lua require'dap'.terminate()<CR>", "stop" },
        },
        f = {
            name = "+telescope",
            f = { "<cmd>Telescope find_files<cr>", "Find files" },
            s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>", "Find Symbols" },
            g = { "<cmd>Telescope live_grep<cr>", "Live grep" },
            h = { "<cmd>Telescope oldfiles<cr>", "Oldfiles" },
            r = { "<cmd>Telescope frecency<cr>", "Frecency" },
            b = { "<cmd>Telescope buffers<cr>", "Live grep" },
        },
        r = {
            name = "+reload",
            r = { "<cmd>source $MYVIMRC<cr>", "Reload init.lua" },
            l = { "<cmd>source %<cr>", "Reload current file" },
        },
    }, {
        prefix = "<leader>",
    })
end

return M
