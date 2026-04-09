-- ============================================================================
-- LSP + 自动补全基础套件
-- 目标：为 lua / markdown / c / cpp / python 提供
-- 1) 语言服务器诊断与跳转 2) 自动补全 3) 代码语义能力
-- ============================================================================

return {
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonUpdate" },
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },

  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    opts = {
      -- 这里是 LSP 服务器名（不是 Mason 包名）。
      ensure_installed = { "lua_ls", "marksman", "clangd", "pyright" },
      automatic_installation = true,
    },
  },

  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    dependencies = { "williamboman/mason.nvim" },
    opts = {
      -- 这里是 Mason 包名，用于自动下载工具与 LSP。
      ensure_installed = {
        "lua-language-server",
        "marksman",
        "clangd",
        "pyright",
      },
      run_on_start = true,
      auto_update = false,
      start_delay = 1000,
      debounce_hours = 12,
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- LSP 通用按键：跳转、引用、实现、重命名、代码动作。
      local on_attach = function(_, bufnr)
        local map = function(mode, lhs, rhs, desc)
          vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, silent = true, desc = desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "跳转定义")
        map("n", "gD", vim.lsp.buf.declaration, "跳转声明")
        map("n", "gr", vim.lsp.buf.references, "查找引用")
        map("n", "gi", vim.lsp.buf.implementation, "跳转实现")
        map("n", "K", vim.lsp.buf.hover, "悬浮文档")
        map("n", "<leader>rn", vim.lsp.buf.rename, "重命名符号")
        map("n", "<leader>ca", vim.lsp.buf.code_action, "代码动作")
        map("n", "[d", vim.diagnostic.goto_prev, "上一个诊断")
        map("n", "]d", vim.diagnostic.goto_next, "下一个诊断")
        map("n", "<leader>e", vim.diagnostic.open_float, "查看诊断")
      end

      vim.diagnostic.config({
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
      })

      local servers = {
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              telemetry = {
                enable = false,
              },
            },
          },
        },
        marksman = {},
        clangd = {},
        pyright = {},
      }

      local function setup_server(server_name, opts)
        -- Neovim 0.11+ 推荐 API：避免 nvim-lspconfig 的弃用告警。
        if vim.lsp.config and vim.lsp.enable then
          vim.lsp.config(server_name, opts)
          vim.lsp.enable(server_name)
          return
        end

        -- 兼容旧版本 Neovim。
        local lspconfig = require("lspconfig")
        if lspconfig[server_name] then
          lspconfig[server_name].setup(opts)
        else
          vim.notify("未找到 LSP 配置: " .. server_name, vim.log.levels.WARN)
        end
      end

      for server_name, opts in pairs(servers) do
        opts.on_attach = on_attach
        opts.capabilities = vim.tbl_deep_extend(
          "force",
          {},
          capabilities,
          opts.capabilities or {}
        )
        setup_server(server_name, opts)
      end
    end,
  },

  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rafamadriz/friendly-snippets",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "path" },
          { name = "buffer" },
        }),
      })
    end,
  },
}
