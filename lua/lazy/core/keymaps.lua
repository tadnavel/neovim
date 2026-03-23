local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ";"
vim.g.maplocalleader = ","

-- paste without yank
map("x", "p", [["_dP]])

-- Exit terminal mode
map("t", "<Esc>", "<C-\\><C-n><CR>", opts)

-- Select all with Ctrl-a
map("n", "<C-a>", "gg<S-v>G", opts)

-- New tab
-- map("n", "<leader>te", ":tabedit ")
-- map("n", "<tab>", ":tabnext<CR>")
-- map("n", "<s-tab>", ":tabprev<CR>")

-- Window split
map("n", "ss", ":split<CR>", opts)
map("n", "sv", ":vsplit<CR>", opts)

-- Resize pane
map("n", "<M-Right>", ":vertical resize +1<CR>", opts)
map("n", "<M-Left>", ":vertical resize -1<CR>", opts)
map("n", "<M-Down>", ":resize +1<CR>", opts)
map("n", "<M-Up>", ":resize -1<CR>", opts)

-- Search a highlighted text
map("v", "//", "y/\\V<C-R>=escape(@\",'/\\')<CR><CR>", opts)
map("n", "<leader>hl", ":noh<CR>", opts)

-- Move between buffers
map("n", "]b", ":bnext<CR>", opts)
map("n", "[b", ":bprev<CR>", opts)

-- Replace visual text
map("v", "<C-r>", '"hy:%s/<C-r>h//gc<left><left><left>', opts)

-- Close buffer without exiting vimmm
map("n", "<leader>bd", ":bp | sp | bn | bd<CR>", opts)

-- scroll
map("n", "<M-j>", "3<C-e>", opts)
map("n", "<M-k>", "3<C-y>", opts)
