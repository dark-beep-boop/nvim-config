-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- This config is adapted to Dvorak keyboards

local map = vim.keymap.set
local unmap = vim.keymap.del

-- Move using the htns keys
map({ "n", "x" }, "t", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "n", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "s", "'l'", { desc = "Left", expr = true, silent = true })

-- Move to window using the <ctrl> htns keys
unmap("n", "<C-j>")
unmap("n", "<C-k>")
unmap("n", "<C-l>")
map("n", "<C-t>", "<C-w>j", { desc = "Go to Lower Window", remap = true })
map("n", "<C-n>", "<C-w>k", { desc = "Go to Upper Window", remap = true })
map("n", "<C-s>", "<C-w>l", { desc = "Go to Right Window", remap = true })

-- Move Lines
unmap("n", "<M-j>")
unmap("i", "<M-j>")
unmap("i", "<M-k>")
unmap("v", "<M-j>")
unmap("v", "<M-k>")
map("n", "<M-t>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<M-n>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<M-t>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<M-n>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<M-t>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<M-n>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- Move cursor up and down in multitext
map("n", "gj", "")
map("n", "gk", "")
map("n", "gt", "'gj'", { desc = "Move cursor down in multiline text" })
map("n", "gn", "'gk'", { desc = "Move cursor up in multiline text" })

-- buffers
unmap("n", "<S-l>")
map("n", "<S-s>", "<cmd>bnext<cr>", { desc = "Next Buffer" })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
-- Move between searches with k
vim.keymap.del({ "x", "o" }, "N")
map("n", "k", "'Nn'[v:searchforward].'zv'", { expr = true, desc = "Next Search Result" })
map("x", "k", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("o", "k", "'Nn'[v:searchforward]", { expr = true, desc = "Next Search Result" })
map("n", "K", "'nN'[v:searchforward].'zv'", { expr = true, desc = "Prev Search Result" })
map("x", "K", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })
map("o", "K", "'nN'[v:searchforward]", { expr = true, desc = "Prev Search Result" })

-- Save file with l
map({ "i", "x", "n", "s" }, "<C-l>", "<cmd>w<cr><esc>", { desc = "Save File" })

-- Jump to character
map({ "n", "x", "o" }, "j", "'t'", { desc = "Jump to before the next occurrence of a character", silent = true })
map({ "n", "x", "o" }, "J", "'T'", { desc = "Jump to after the previous occurrence of a character", silent = true })

-- Go to file edited before tag jump
map(
  { "n", "x", "o" },
  "<C-j>",
  "'<C-t>'",
  { desc = "Go to the file you wehe editing before the last tag jump", silent = true }
)

-- Move down
map({ "n", "x", "o" }, "<C-k>", "'<C-n>'", { desc = "move down one line", silent = true })

-- Delete and substitute
map("n", "l", "'s'", { desc = "Delete character and substitute text", silent = true })
map("n", "L", "'S'", { desc = "Delete line and substitute text", silent = true })

-- Join lines
map({ "n", "x", "o" }, "T", "'J'", { desc = "Join current line with the next one with space", silent = true })
map({ "n", "x", "o" }, "gT", "'gJ'", { desc = "Join current line with the next one without space", silent = true })

-- Hover
map("n", "N", function()
  return vim.lsp.buf.hover()
end, { desc = "Hover", silent = true })

-- Move to the bottom of the screen
map("n", "S", "'L'", { desc = "Move to the bottom of the screen", silent = true })
