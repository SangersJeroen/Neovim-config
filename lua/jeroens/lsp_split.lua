-- Jump to the LSP definition of the symbol under the cursor, opening it in a
-- new split that takes focus.

local M = {}

---@param split_cmd "split" | "vsplit"
function M.definition_split(split_cmd)
    vim.lsp.buf.definition({
        on_list = function(opts)
            local items = opts.items
            if vim.tbl_isempty(items) then
                vim.notify("No definition found", vim.log.levels.INFO)
                return
            end

            -- Several definitions: keep them all in the quickfix list, jump to the first.
            if #items > 1 then
                vim.fn.setqflist({}, " ", { title = opts.title, items = items })
            end

            local first = items[1]
            -- `split <file>` opens the target in the new window, so the current
            -- buffer does not have to be saved or hidden first.
            vim.cmd(split_cmd .. " " .. vim.fn.fnameescape(first.filename))
            vim.api.nvim_win_set_cursor(0, { first.lnum, first.col - 1 })
            vim.cmd("normal! zz")
        end,
    })
end

return M
