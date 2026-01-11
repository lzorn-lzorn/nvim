
-- 设置 Leader 键为空格
vim.g.mapleader = " "                  -- Leader 键
vim.g.maplocalleader = " "             -- Local Leader 键

-- 快捷键映射辅助函数
local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

--[[
keymap(mode, lhs, rhs, opts)
- mode: 在什么模式下触发生效 (n, i, c)
- lhs: 实际按下的快捷键
- rhs: 映射之后的快捷键
- opts: 快捷键位的额外配置
Eg:
    vim.keymap.set("n", "<C-a>b", ":lua print('Hello World')<CR>", { silent = true })
    <CR>: 是Enter 回车
Eg:
    
    vim.keymap.set("i", "<C-a>b", "<Cmd>lua print('Hello World')<CR>", { silent = true })
    <Cmd>: 当前进入命令模式使用的案件, 因为使用 `:` 会被单纯的模拟按下 `:` 导致直接输入了 ":"
]]
-- 基本操作
keymap("n", "<leader>w", ":w<CR>", opts)              -- 保存文件
keymap("n", "<leader>q", ":q<CR>", opts)              -- 退出
keymap("n", "<leader>Q", ":qa! <CR>", opts)            -- 强制退出所有

-- 取消搜索高亮
keymap("n", "<Esc>", ":nohlsearch<CR>", opts)         -- 按 Esc 取消高亮
keymap("n", "<leader>h", ":nohlsearch<CR>", opts)     -- 或使用 <leader>h

-- 窗口导航
keymap("n", "<C-h>", "<C-w>h", opts)                  -- 跳转到左侧窗口
keymap("n", "<C-j>", "<C-w>j", opts)                  -- 跳转到下方窗口
keymap("n", "<C-k>", "<C-w>k", opts)                  -- 跳转到上方窗口
keymap("n", "<C-l>", "<C-w>l", opts)                  -- 跳转到右侧窗口

-- 窗口大小调整
keymap("n", "<C-Up>", ":resize +2<CR>", opts)         -- 增加高度
keymap("n", "<C-Down>", ":resize -2<CR>", opts)       -- 减少高度
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)  -- 减少宽度
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts) -- 增加宽度

-- 分屏
keymap("n", "<leader>sv", ":vsplit<CR>", opts)        -- 垂直分屏
keymap("n", "<leader>sh", ":split<CR>", opts)         -- 水平分屏
keymap("n", "<leader>sc", ":close<CR>", opts)         -- 关闭当前窗口

-- 标签页
keymap("n", "<leader>tn", ":tabnew<CR>", opts)        -- 新标签页
keymap("n", "<leader>tc", ":tabclose<CR>", opts)      -- 关闭标签页
keymap("n", "<leader>to", ":tabonly<CR>", opts)       -- 只保留当前标签页
keymap("n", "<Tab>", ":tabnext<CR>", opts)            -- 下一个标签页
keymap("n", "<S-Tab>", ":tabprevious<CR>", opts)      -- 上一个标签页

-- 缓冲区导航
keymap("n", "<leader>bn", ": bnext<CR>", opts)         -- 下一个缓冲区
keymap("n", "<leader>bp", ":bprevious<CR>", opts)     -- 上一个缓冲区
keymap("n", "<leader>bd", ":bdelete<CR>", opts)       -- 删除缓冲区

-- 移动行
keymap("n", "<A-j>", ":m .+1<CR>==", opts)            -- 向下移动行
keymap("n", "<A-k>", ":m .-2<CR>==", opts)            -- 向上移动行
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", opts)        -- 向下移动选中行
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", opts)        -- 向上移动选中行

-- 缩进调整（保持选中状态）
keymap("v", "<", "<gv", opts)                         -- 减少缩进
keymap("v", ">", ">gv", opts)                         -- 增加缩进

-- 复制粘贴
keymap("v", "p", '"_dP', opts)                        -- 粘贴时不覆盖寄存器

-- 快速移动
keymap("n", "<C-d>", "<C-d>zz", opts)                 -- 向下翻页并居中
keymap("n", "<C-u>", "<C-u>zz", opts)                 -- 向上翻页并居中
keymap("n", "n", "nzzzv", opts)                       -- 下一个搜索结果并居中
keymap("n", "N", "Nzzzv", opts)                       -- 上一个搜索结果并居中

-- 文件管理
keymap("n", "<leader>e", ": Explore<CR>", opts)        -- 打开文件浏览器
keymap("n", "<leader>E", ": Vexplore<CR>", opts)       -- 垂直分屏打开文件浏览器

-- 快速编辑配置文件
keymap("n", "<leader>ev", ":e $MYVIMRC<CR>", opts)    -- 编辑配置文件
keymap("n", "<leader>sv", ":source $MYVIMRC<CR>", opts) -- 重新加载配置

keymap("i", "<C-c>", '<Esc>"+yi', opt)
-- 终端模式
keymap("t", "<Esc>", "<C-\\><C-n>", opts)             -- 终端模式下 Esc 返回普通模式
-- 水平分屏打开终端
keymap("n", "<leader>th", ":split | terminal<CR>", { desc = "终端 (水平)" })
-- 垂直分屏打开终端
keymap("n", "<leader>tv", ":vsplit | terminal<CR>", { desc = "终端 (垂直)" })
-- 新标签页打开终端
keymap("n", "<leader>tt", ":tabnew | terminal<CR>", { desc = "终端 (标签页)" })
-- 全屏终端
keymap("n", "<leader>tf", ":terminal<CR>", { desc = "终端 (全屏)" })

-- 兼容旧的操作习惯
vim.keymap.set('i', '<C-c>', '<Esc>"+yi', { noremap = true, desc = '复制（需配合选择）' })
-- Ctrl+V: 粘贴
vim.keymap.set('i', '<C-v>', '<C-r>+', { noremap = true, desc = '粘贴' })
-- Ctrl+X: 剪切当前行
vim.keymap. set('i', '<C-x>', '<Esc>"+ddi', { noremap = true, desc = '剪切行' })
-- Ctrl+A: 全选
vim.keymap.set('i', '<C-a>', '<Esc>ggVG', { noremap = true, desc = '全选' })
-- Ctrl+Z: 撤销
vim.keymap. set('i', '<C-z>', '<Esc>ui', { noremap = true, desc = '撤销' })
-- Ctrl+S: 保存
vim.keymap.set('i', '<C-s>', '<Esc>:w<CR>a', { noremap = true, desc = '保存' })

-- Shift+方向键：选择文本（类似 Windows）
vim.keymap.set('n', '<S-Up>', 'v<Up>', { noremap = true, desc = '向上选择' })
vim.keymap.set('n', '<S-Down>', 'v<Down>', { noremap = true, desc = '向下选择' })
vim.keymap.set('n', '<S-Left>', 'v<Left>', { noremap = true, desc = '向左选择' })
vim.keymap.set('n', '<S-Right>', 'v<Right>', { noremap = true, desc = '向右选择' })

vim.keymap.set('v', '<S-Up>', '<Up>', { noremap = true, desc = '向上扩展选择' })
vim.keymap.set('v', '<S-Down>', '<Down>', { noremap = true, desc = '向下扩展选择' })
vim.keymap.set('v', '<S-Left>', '<Left>', { noremap = true, desc = '向左扩展选择' })
vim.keymap.set('v', '<S-Right>', '<Right>', { noremap = true, desc = '向右扩展选择' })

-- Insert 模式下也支持 Shift+方向键选择
vim.keymap.set('i', '<S-Up>', '<Esc>v<Up>', { noremap = true, desc = '向上选择' })
vim.keymap.set('i', '<S-Down>', '<Esc>v<Down>', { noremap = true, desc = '向下选择' })
vim.keymap.set('i', '<S-Left>', '<Esc>v<Left>', { noremap = true, desc = '向左选择' })
vim.keymap.set('i', '<S-Right>', '<Esc>v<Right>', { noremap = true, desc = '向右选择' })
-- Ctrl+D: 复制当前行到下一行 
vim.keymap.set('i', '<C-d>', '<Esc>yypi', { noremap = true, desc = '复制行' })
