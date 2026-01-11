local opt = vim.opt
-- 显示行号
opt.number = true                  -- 显示绝对行号
opt.relativenumber = true          -- 显示相对行号（便于跳转）

-- 光标行高亮
opt.cursorline = true              -- 高亮当前行
opt.cursorcolumn = true            -- 高亮当前列（可选, 这样竖着也有一个透明的线）

-- 缩进设置
opt.tabstop = 2                    -- Tab 键显示为 4 个空格
opt.shiftwidth = 2                 -- 自动缩进时使用 4 个空格
opt.expandtab = true               -- 将 Tab 转换为空格
opt.smartindent = true             -- 智能缩进
opt.autoindent = true              -- 自动缩进

-- 搜索设置
opt.ignorecase = true              -- 搜索时忽略大小写
opt.smartcase = true               -- 如果搜索词包含大写，则区分大小写
opt.hlsearch = true                -- 高亮搜索结果
opt.incsearch = true               -- 实时搜索（边输入边高亮）

-- 界面设置
opt.termguicolors = true           -- 启用真彩色支持
opt.signcolumn = "yes"             -- 始终显示符号列（避免抖动）
opt.scrolloff = 8                  -- 光标上下保持 8 行距离
opt.sidescrolloff = 8              -- 光标左右保持 8 列距离
opt.wrap = false                   -- 不自动换行
-- opt.wrap = true                 -- 如果需要自动换行，取消上面的注释

-- 分屏设置
opt.splitbelow = true              -- 水平分屏时新窗口在下方
opt.splitright = true              -- 垂直分屏时新窗口在右侧

-- 文件编码
opt.encoding = "utf-8"             -- 内部编码
opt.fileencoding = "utf-8"         -- 文件编码

-- 备份和交换文件
opt.backup = false                 -- 不创建备份文件
opt.writebackup = false            -- 写入时不创建备份
opt.swapfile = false               -- 不创建交换文件
-- 如果需要备份，可以设置备份目录：
-- opt.backupdir = vim.fn.stdpath("data") .."/backup"
-- opt.directory = vim.fn.stdpath("data") .."/swap"

-- 撤销文件
opt.undofile = true                -- 启用持久化撤销
opt.undodir = vim.fn.stdpath("data") .."/undo"  -- 撤销文件目录

-- 更新时间
opt.updatetime = 300               -- 更新时间（毫秒），影响 CursorHold 事件
opt.timeoutlen = 500               -- 按键序列等待时间（毫秒）

-- 命令行
opt.showcmd = true                 -- 显示正在输入的命令
opt.cmdheight = 1                  -- 命令行高度
opt.showmode = true                -- 显示当前模式（INSERT、NORMAL 等）

-- 补全设置
opt.completeopt = "menu,menuone,noselect"  -- 补全菜单行为
opt.pumheight = 10                 -- 补全菜单最大高度

-- 其他设置
opt.mouse = "a"                    -- 启用鼠标支持
opt.clipboard = "unnamedplus"      -- 使用系统剪贴板
opt.hidden = true                  -- 允许切换缓冲区时不保存
opt.history = 1000                 -- 命令历史记录数量
opt.wildmenu = true                -- 命令行补全增强
opt.wildmode = "longest:full,full" -- 补全模式

-- 显示不可见字符（可选）
opt.list = false                   -- 是否显示不可见字符
opt.listchars = {                  -- 不可见字符的显示方式
    tab = "→ ",                        -- Tab 显示为箭头
    trail = "·",                       -- 行尾空格显示为点
    extends = "›",                     -- 右侧有内容时显示
    precedes = "‹",                    -- 左侧有内容时显示
    nbsp = "␣",                        -- 不间断空格
}

-- 折叠设置
opt.foldenable = true              -- 启用折叠
opt.foldmethod = "indent"          -- 基于缩进的折叠
opt.foldlevel = 99                 -- 默认展开所有折叠

-- 状态栏设置
opt.laststatus = 3                -- 全局状态栏