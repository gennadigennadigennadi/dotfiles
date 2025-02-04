return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
        numhl = true,
        current_line_blame = false,
        current_line_blame_opts = {
            virt_text = true,
            -- virt_text_pos     = "right_align",
            delay = 20,
            ignore_whitespace = true,
        },
        on_attach = function(bufnr)
            local gs = require('gitsigns')

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Actions
            map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>", { desc = "stage hunk" })
            map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>", { desc = "reset hunk" })
            map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
            map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
            map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
            map("n", "<leader>hp", gs.preview_hunk, { desc = "preview hunk" })
            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, { desc = "blame line full" })
            map("n", "<leader>hb", gs.toggle_current_line_blame, { desc = "toggle current line blame" })
            map("n", "<leader>hd", gs.diffthis)
            map("n", "<leader>hD", function()
                gs.diffthis("~")
            end, { desc = "diff this" })
            map("n", "<leader>td", gs.toggle_deleted, { desc = "toggle deleted" })

            -- Text object
            map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
        end,
    },
}
