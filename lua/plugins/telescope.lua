-- ============================================================================
-- Telescope - 模糊查找
-- ~/.config/nvim/lua/plugins/telescope.lua
-- ============================================================================

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      -- build = "make",
      build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
      cond = function()
        return vim.fn.executable("make") == 1
      end,
    },
  },
  cmd = "Telescope",
  -- telescope 是依赖控制台工具 ripgrep
  -- Windows: scoop install ripgrep / choco install ripgrep
  keys = {
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "查找文件" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "搜索文本" },
    { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "查找缓冲区" },
    { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "帮助文档" },
    { "<leader>fr", "<cmd>Telescope oldfiles<cr>", desc = "最近文件" },
    { "<leader>fc", "<cmd>Telescope commands<cr>", desc = "命令" },
    { "<leader>fk", "<cmd>Telescope keymaps<cr>", desc = "快捷键" },
    { "<leader>ft", "<cmd>Telescope colorscheme<cr>", desc = "切换主题" },
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local have_nerd_font = vim.g.have_nerd_font == true
    local find_files_picker = { hidden = true }
    local ui_state = {
      telescope_active = false,
      showmode = nil,
    }

    -- 按平台自动选择可用的文件扫描命令，避免 rg 未安装时报错。
    if vim.fn.executable("rg") == 1 then
      find_files_picker.find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!.git/*",
      }
    elseif vim.fn.executable("fd") == 1 then
      find_files_picker.find_command = {
        "fd",
        "--type",
        "f",
        "--hidden",
        "--exclude",
        ".git",
      }
    elseif vim.fn.executable("fdfind") == 1 then
      find_files_picker.find_command = {
        "fdfind",
        "--type",
        "f",
        "--hidden",
        "--exclude",
        ".git",
      }
    elseif vim.fn.has("win32") == 1 then
      -- Windows 兜底方案：避免 Telescope 默认 where 检测失败产生警告。
      find_files_picker.find_command = {
        "cmd",
        "/c",
        "dir",
        "/b",
        "/s",
        "/a-d",
      }
    end

    telescope.setup({
      defaults = {
        prompt_prefix = have_nerd_font and "🔍 " or "> ",
        selection_caret = have_nerd_font and "❯ " or "-> ",
        color_devicons = have_nerd_font,
        path_display = { "smart" },
        mappings = {
          i = {
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = actions.send_to_qflist + actions.open_qflist,
            ["<Esc>"] = actions.close,
          },
        },
      },
      pickers = {
        find_files = find_files_picker,
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
      },
    })

    -- fzf-native 在缺少 make 或编译失败时可能不可用，需安全加载以避免启动报错。
    pcall(telescope.load_extension, "fzf")

    -- Telescope 输入模式下，showmode 会在命令行额外显示 "-- INSERT --"，
    -- 容易造成“第二个光标闪烁”的视觉问题。这里仅在 Telescope 打开时临时关闭。
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "TelescopePrompt",
      callback = function(ev)
        if not ui_state.telescope_active then
          ui_state.showmode = vim.o.showmode
          ui_state.telescope_active = true
        end

        vim.o.showmode = false

        vim.api.nvim_create_autocmd({ "BufLeave", "BufWipeout" }, {
          buffer = ev.buf,
          once = true,
          callback = function()
            if ui_state.telescope_active then
              vim.o.showmode = ui_state.showmode ~= false
              ui_state.telescope_active = false
            end
          end,
        })
      end,
    })
  end,
}
