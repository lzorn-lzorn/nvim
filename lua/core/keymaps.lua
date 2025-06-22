vim.g.mapleader = " "

local keymap = vim.keymap

-- ------------ 插入模式 ------------
keymap.set("i", "jk", "<ESC>")


-- ------------ 插入模式 ------------
keymap.set("v", "J", ":m '>+1<CR>gv=gv")
keymap.set("v", "K", ":m '<-2<CR>gv=gv")


-- ------------ 普通模式 ------------
keymap.set("n", "<leader>sv", "<C-w>v") -- 水平增加窗口
keymap.set("n", "<leader>sh", "<C-w>s") -- 垂直增加窗口

keymap.set("n", "<leader>nh", ":nohl<CR>") -- 取消高亮

-- ------------ 插件 ------------
keymap.set("n", "<leader>e", function()
    require("nvim-tree.api").tree.toggle()
  end, { desc = "Toggle NvimTree" })