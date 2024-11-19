return {

    -- disable a default indent line
    -- { "lukas-reineke/indent-blankline.nvim", enabled = false },

    {
        "stevearc/conform.nvim",
        -- event = 'BufWritePre', -- uncomment for format on saves
        opts = require "configs.conform",
    },

    -- These are some examples, uncomment them if you want to see them work!
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    -- treesitter syntax
    {
        "nvim-treesitter/nvim-treesitter",
        opts = {
            ensure_installed = {
                "go",
                "vim",
                "lua",
                "css",
                "sql",
                "vue",
                "bash",
                "html",
                "json",
                "scss",
                "yaml",
                "vimdoc",
                "regex",
                "jsdoc",
                "gomod",
                "gosum",
                "gowork",
                "markdown",
                "gitcommit",
                "gitignore",
                "git_config",
                "javascript",
                "typescript",
                "markdown_inline",
            },
        },
    },

    ---- color brackets
    { "HiPhish/rainbow-delimiters.nvim" },

    ---- signature help
    {
        "ray-x/lsp_signature.nvim",
        event = "BufRead",
        config = function()
            require("lsp_signature").setup()
        end,
    },

    ---- live server
    {
        "ngtuonghy/live-server-nvim",
        event = "VeryLazy",
        build = ":LiveServerInstall",
        config = function()
            local srv = require "live-server-nvim"
            srv.setup {
                custom = {
                    "--port=8080",
                    "--no-css-inject",
                },
                serverPath = vim.fn.stdpath "data" .. "/live-server/", --default
                open = "folder", -- folder|cwd     --default
            }
        end,
    },

    ---- minimap ...
    {
        "gorbit99/codewindow.nvim",
        config = function()
            local codewindow = require "codewindow"
                codewindow.setup {
                    exclude_filetypes = { "help" }, -- Choose certain filetypes to not show minimap on
                    minimap_width = 10, -- The width of the text part of the minimap
                    width_multiplier = 4, -- How many characters one dot represents
                    window_border = "single", -- The border style of the floating window (accepts all usual options)
                    events = { "TextChanged", "InsertLeave", "DiagnosticChanged", "FileWritePost" }, -- Events that update the code window
                }
            codewindow.apply_default_keybinds()
        end,
    },

    ---- go binaries
    {
        {
            "crispgm/nvim-go",
            event = "User AstroFile",
            config = function()
                require("go").setup {
                    notify = true,
                    -- auto commands
                    auto_format = true,
                    auto_lint = true,
                    -- linters: revive, errcheck, staticcheck, golangci-lint
                    linter = "golangci-lint",
                    -- lint_prompt_style: qf (quickfix), vt (virtual text)
                    lint_prompt_style = "qf",
                }
            end,
            cmd = { "GoInstallBinaries", "GoUpdateBinaries", "GoTest" },
        },
    },

    ---- lsp show pupup window
    {
        "rmagatti/goto-preview",
        event = "User AstroFile",
        config = function()
            require("goto-preview").setup {
                width = 120, -- Width of the floating windo
                wheight = 15, -- Height of the floating window
                border = { "↖", "─", "┐", "│", "┘", "─", "└", "│" }, -- Border characters of the floating window
                default_mappings = false, -- Bind default mappings
                debug = false, -- Print debug information
                opacity = nil, -- 0-100 opacity level of the floating window where 100 is fully transparent.
                resizing_mappings = false, -- Binds arrow keys to resizing the floating window.
                post_open_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
                post_close_hook = nil, -- A function taking two arguments, a buffer and a window to be ran as a hook.
                references = { -- Configure the telescope UI for slowing the references cycling window. 
                    telescope = require("telescope.themes").get_dropdown { hide_preview = false },
                },
                focus_on_open = true, -- Focus the floating window when opening it.
                dismiss_on_move = false, -- Dismiss the floating window when moving the cursor.
                force_close = true, -- passed into vim.api.nvim_win_close's second argument. See :h nvim_win_close
                bufhidden = "wipe", -- the bufhidden option to set on the floating window. See :h bufhidden 
                stack_floating_preview_windows = true, -- Whether to nest floating windows 
                preview_window_title = { enable = true, position = "left" }, -- Whether to set the preview window title as the filename
            }
        end,
    },

    -- Notify
    {
        "rcarriga/nvim-notify",
        event = "User AstroFile",
        config = function()
            require('telescope').extensions.notify.notify()
        end,
        opts = {
            timeout = 3000,
            max_height = function()
                return math.floor(vim.o.lines * 0.75)
            end,
            max_width = function()
                return math.floor(vim.o.columns * 0.75)
            end,
        },
    },

    ---- Codeium autocompletion
    {
        'Exafunction/codeium.vim',
        event = 'BufEnter',
        config = function ()
            vim.g.codeium_disable_bindings = 1
            -- Change '<C-g>' here to any keycode you like.
            vim.keymap.set('i', '<C-g>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true })
            vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true })
        end
    },

} -- END
