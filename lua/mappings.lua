require "nvchad.mappings"

local map = vim.keymap.set
-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>)

-- ***************************************************|
-- NORMAL MOD
-- ***************************************************|
map("n", ";", ":", { desc = "CMD enter command mode" })

-- nvimtree
map("n", "<leader>o", "<cmd>NvimTreeFocus<CR>", { desc = "focus menu" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "open close menu" })

-- come off
map("n", "<leader>q", ":q<cr>", { desc = "leave" })

-- save changes
map("n", "<leader>w", ":w<cr>", { desc = "save changes" })

-- live server
map("n", "sl", ":LiveServerStart<cr>", { desc = "server start" })
map("n", "ss", ":LiveServerStop<cr>", { desc = "server stop" })

-- split window
map("n", "sh", "<C-w>s", { desc = "split window" })
map("n", "sv", "<C-w>v", { desc = "split window horizontal" })
-- move window
map("n", "<leader>1", ":vertical resize +8<cr>", { desc = "move split right" })
map("n", "<leader>2", ":vertical resize -8<cr>", { desc = "move split left" })
map("n", "<leader>3", ":resize +5<cr>", { desc = "move split up" })
map("n", "<leader>4", ":resize -5<cr>", { desc = "move split down" })

-- goto preview
map("n", "ld", "<cmd>lua require('goto-preview').goto_preview_definition()<CR>", { desc = "LSP definition" })
map("n", "lt", "<cmd>lua require('goto-preview').goto_preview_type_definition()<CR>", { desc = "LSP type definition" })
map("n", "li", "<cmd>lua require('goto-preview').goto_preview_implementation()<CR>", { desc = "LSP implementation" })
map("n", "lc", "<cmd>lua require('goto-preview').close_all_win()<CR>", { desc = "close preview" })
map("n", "lr", "<cmd>lua require('goto-preview').goto_preview_references()<CR>", { desc = "LSP references" })
map("n", "lp", "<cmd>lua require('goto-preview').goto_preview_declaration()<CR>", { desc = "LSP declaration" })

-- notify
map("n", "nt", "<cmd> Telescope notify <CR>", { desc = "notify" })
map("n", "nh", "<cmd>lua require('notify').history()<CR>", { desc = "notify history" })

-- ***************************************************|
-- INSERT MOD
-- ***************************************************|

-- scape
map("i", "jk", "<ESC>")

-- ***************************************************|
-- VISUAL MOD
-- ***************************************************|

--  Movement -> or <-
map("v", "<", "<gv", { desc = "indent left" })
map("v", ">", ">gv", { desc = "indent left" })

--  Move lines up or down
map("v", "J", ":move '>+1<CR>gv-gv", { desc = "Move selection line down" })
map("v", "K", ":move '<-2<CR>gv-gv", { desc = "Move selection line up" })

-- ***************************************************|
--
