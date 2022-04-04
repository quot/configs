local opts = { noremap = true, silent = true }
local term_opts = { silent = true }
local km = vim.api.nvim_set_keymap

km("", "<Leader>ff", ":Telescope find_files<cr>", opts)
km("", "<Leader>fg", ":Telescope live_grep<cr>", opts)
km("", "<Leader>fb", ":Telescope buffers<cr>", opts)
km("", "<Leader>fh", ":Telescope help_tags<cr>", opts)

-- Setup telescope with fzf settings
require('telescope').setup {
    defaults = {
        path_display = { "smart" },
    },
    pickers = {
        find_files = { theme = "dropdown" },
        live_grep = { theme = "dropdown" },
        grep_string = { theme = "dropdown" },
        git_files = { theme = "dropdown" },
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
    }}
}

-- Load fzf extension after setup
require('telescope').load_extension('fzf')
