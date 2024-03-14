return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    opts = {
        signs = {
            untracked = {
                text = "┆",
            },
            add = {
                text = "▍",
            },
            change = {
                text = "▍",
            },
            delete = {
                text = "▸",
            },
            topdelete = {
                text = "▾",
            },
            changedelete = {
                text = "▍",
            },
        },
        current_line_blame = false,
        current_line_blame_opts = {
            virt_text = true,
            -- virt_text_pos     = "right_align",
            delay = 20,
            ignore_whitespace = false,
        },
        on_attach = function(bufnr)
            local gs = package.loaded.gitsigns

            local function map(mode, l, r, opts)
                opts = opts or {}
                opts.buffer = bufnr
                vim.keymap.set(mode, l, r, opts)
            end

            -- Navigation
            map("n", "]c", function()
                if vim.wo.diff then
                    return "]c"
                end
                vim.schedule(function()
                    gs.next_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            map("n", "[c", function()
                if vim.wo.diff then
                    return "[c"
                end
                vim.schedule(function()
                    gs.prev_hunk()
                end)
                return "<Ignore>"
            end, { expr = true })

            -- Actions
            map({ "n", "v" }, "<leader>hs", ":Gitsigns stage_hunk<CR>")
            map({ "n", "v" }, "<leader>hr", ":Gitsigns reset_hunk<CR>")
            map("n", "<leader>hS", gs.stage_buffer, { desc = "stage buffer" })
            map("n", "<leader>hu", gs.undo_stage_hunk, { desc = "undo stage hunk" })
            map("n", "<leader>hR", gs.reset_buffer, { desc = "reset buffer" })
            map("n", "<leader>hp", gs.preview_hunk)
            map("n", "<leader>hb", function()
                gs.blame_line({ full = true })
            end, { desc = "blame line full" })
            map("n", "<leader>tb", gs.toggle_current_line_blame, { desc = "toggle current line blame" })
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
