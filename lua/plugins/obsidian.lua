return {
    {
        "epwalsh/obsidian.nvim",
        version = "*", -- recommended, use latest release instead of latest commit
        lazy = true,
        event = {
            -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
            -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
            "BufReadPre /home/jeroensangers/Shard/**/*.md",
            "BufNewFile /home/jeroensangers/Shard/**/*.md",
        },
        keys = {
            { "<leader>o", desc = "Obsidian New Note" },
        },
        config = function()
            require('obsidian').setup({
                -- A list of vault names and paths.
                -- Each path should be the path to the vault root. If you use the Obsidian app,
                -- the vault root is the parent directory of the `.obsidian` folder.
                workspaces = {
                    {
                        name = "Shard",
                        path = "~/Shard",
                    },
                },
                { ui = { enable = false } },
                -- Optional, if you keep notes in a specific subdirectory of your vault.
                notes_subdir = "modica",

                -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
                -- levels defined by "vim.log.levels.*".
                log_level = vim.log.levels.INFO,

                daily_notes = {
                    -- Optional, if you keep daily notes in a separate directory.
                    folder = "dailies",
                    -- Optional, if you want to change the date format for the ID of daily notes.
                    date_format = "%Y-%m-%d",
                    -- Optional, if you want to change the date format of the default alias of daily notes.
                    alias_format = "%B %-d, %Y",
                    -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
                    template = 'daily.md'
                },

                -- Where to put new notes created from completion. Valid options are
                --  * "current_dir" - put new notes in same directory as the current buffer.
                --  * "notes_subdir" - put new notes in the default notes subdirectory.
                new_notes_location = "notes_subdir",

                -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
                completion = {
                    -- Set to false to disable completion.
                    nvim_cmp = true,

                    -- Trigger completion at 2 chars.
                    min_chars = 3,
                },

                -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
                -- way then set 'mappings = {}'.
                mappings = {
                    -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
                    ["gf"] = {
                        action = function()
                            return require("obsidian").util.gf_passthrough()
                        end,
                        opts = { noremap = false, expr = true, buffer = true },
                    },
                    -- Toggle check-boxes.
                    ["<leader>ch"] = {
                        action = function()
                            return require("obsidian").util.toggle_checkbox()
                        end,
                        opts = { buffer = true },
                    },
                },

                -- Optional, customize how names/IDs for new notes are created.
                note_id_func = function(title)
                    -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
                    -- In this case a note with the title 'My new note' will be given an ID that looks
                    -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
                    local suffix = ""
                    if title ~= nil then
                        -- If title is given, transform it into valid file name.
                        suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
                    else
                        -- If title is nil, just add 4 random uppercase letters to the suffix.
                        for _ = 1, 4 do
                            suffix = suffix .. string.char(math.random(65, 90))
                        end
                    end
                    return suffix
                end,

                -- Optional, boolean or a function that takes a filename and returns a boolean.
                -- `true` indicates that you don't want obsidian.nvim to manage frontmatter.
                disable_frontmatter = false,

                -- Optional, alternatively you can customize the frontmatter data.
                note_frontmatter_func = function(note)
                    -- This is equivalent to the default frontmatter function.
                    local out = { id = note.id, aliases = note.aliases, tags = note.tags }
                    -- `note.metadata` contains any manually added fields in the frontmatter.
                    -- So here we just make sure those fields are kept in the frontmatter.
                    if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
                        for k, v in pairs(note.metadata) do
                            out[k] = v
                        end
                    end
                    return out
                end,

                -- Optional, for templates (see below).
                templates = {
                    subdir = "templates",
                    date_format = "%Y-%m-%d",
                    time_format = "%H:%M",
                    -- A map for custom variables, the key should be the variable and the value a function
                    substitutions = {},
                },

                -- Optional, by default when you use `:ObsidianFollowLink` on a link to an external
                -- URL it will be ignored but you can customize this behavior here.
                follow_url_func = function(url)
                    -- Open the URL in the default web browser.
                    vim.fn.jobstart({ "xdg-open", url }) -- linux
                end,

                -- Optional, set to true if you use the Obsidian Advanced URI plugin.
                -- https://github.com/Vinzent03/obsidian-advanced-uri
                use_advanced_uri = false,

                -- Optional, set to true to force ':ObsidianOpen' to bring the app to the foreground.
                open_app_foreground = false,

                -- Optional, by default commands like `:ObsidianSearch` will attempt to use
                -- telescope.nvim, fzf-lua, or fzf.vim (in that order), and use the
                -- first one they find. You can set this option to tell obsidian.nvim to always use this
                -- finder.
                finder = "telescope.nvim",

                -- Optional, sort search results by "path", "modified", "accessed", or "created".
                -- The recommend value is "modified" and `true` for `sort_reversed`, which means, for example,
                -- that `:ObsidianQuickSwitch` will show the notes sorted by latest modified time
                sort_by = "modified",
                sort_reversed = true,

                -- Optional, determines how certain commands open notes. The valid options are:
                -- 1. "current" (the default) - to always open in the current window
                -- 2. "vsplit" - to open in a vertical split if there's not already a vertical split
                -- 3. "hsplit" - to open in a horizontal split if there's not already a horizontal split
                open_notes_in = "current",

                attachments = {
                    -- The default folder to place images in via `:ObsidianPasteImg`.
                    -- If this is a relative path it will be interpreted as relative to the vault root.
                    -- You can always override this per image by passing a full path to the command instead of just a filename.
                    img_folder = "assets/imgs", -- This is the default
                    -- A function that determines the text to insert in the note when pasting an image.
                    -- It takes two arguments, the `obsidian.Client` and a plenary `Path` to the image file.
                    -- This is the default implementation.
                    ---@param client obsidian.Client
                    ---@param path Path the absolute path to the image file
                    ---@return string
                    img_text_func = function(client, path)
                        local link_path
                        local vault_relative_path = client:vault_relative_path(path)
                        if vault_relative_path ~= nil then
                            -- Use relative path if the image is saved in the vault dir.
                            link_path = vault_relative_path
                        else
                            -- Otherwise use the absolute path.
                            link_path = tostring(path)
                        end
                        local display_name = vim.fs.basename(link_path)
                        return string.format("![%s](%s)", display_name, link_path)
                    end,
                },

                -- Optional, set the YAML parser to use. The valid options are:
                --  * "native" - uses a pure Lua parser that's fast but potentially misses some edge cases.
                --  * "yq" - uses the command-line tool yq (https://github.com/mikefarah/yq), which is more robust
                --    but much slower and needs to be installed separately.
                -- In general you should be using the native parser unless you run into a bug with it, in which
                -- case you can temporarily switch to the "yq" parser until the bug is fixed.
                yaml_parser = "native",
            })
            local hydra = require("hydra")
            local cmd = require("hydra.keymap-util").cmd

            hydra({
                name = "Obsidian",
                mode = { "n" },
                config = {
                    color = "teal",
                    invoke_on_body = true,
                    hint = {
                        type = "window",
                        positions = "top",
                        border = "rounded",
                        show_name = true,
                    }
                },
                hint = [[
^                Obsidian Note:             ^
^                                           ^
^       _t_: Today's       _n_: New         ^
^       _y_: Yesterday's   _s_: Search      ^
^       _T_: Tomorrow's    _f_: Template Ins^
^                                           ^
^               _q_/_<Esc>_: Quit           ^
            ]],
                body = "<Space>o",
                heads = {
                    { "t",     cmd "ObsidianToday",     { desc = "Today's Note", nowait = true, exit_before = true } },
                    { "y",     cmd "ObsidianYesterday", { desc = "Yesterday's Note", nowait = true, exit_before = true } },
                    { "T",     cmd "ObsidianTomorrow",  { desc = "Tomorrow's Note", nowait = true, exit_before = true } },
                    { "n",     cmd "ObsidianNew",       { desc = "New Note", nowait = true, exit_before = true } },
                    { "s",     cmd "ObsidianSearch",    { desc = "Search Notes", nowait = true, exit_before = true } },
                    { "f",     cmd "ObsidianTemplate",  { desc = "Insert Template", nowait = true, exit_before = true } },
                    { "q",     nil,                     { desc = "quit", exit = true, nowait = true, exit_before = true } },
                    { "<Esc>", nil,                     { desc = "quit", exit = true, nowait = true, exit_before = true } },
                }
            })
        end,
    }
}
