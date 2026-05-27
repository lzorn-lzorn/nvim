return {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    event = "UIEnter",

    init = function()
        vim.opt.mousemoveevent = true
        vim.opt.showtabline = 2
    end,

    keys = {
        { "<Tab>", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
        { "<S-Tab>", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },
        { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "下一个缓冲区" },
        { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "上一个缓冲区" },

        { "<leader>bp", "<cmd>BufferLinePick<cr>", desc = "选择缓冲区" },
        { "<leader>bc", "<cmd>BufferLinePickClose<cr>", desc = "选择关闭" },
        { "<leader>bC", "<cmd>BufferLineCloseOthers<cr>", desc = "关闭其他" },
        { "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "关闭右侧" },
        { "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "关闭左侧" },
    },

    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                themable = true,

                numbers = "none",

                close_command = "bdelete! %d",
                right_mouse_command = "bdelete! %d",
                left_mouse_command = "buffer %d",
                middle_mouse_command = nil,

                indicator = {
                    icon = "▎",
                    style = "icon",
                },

                buffer_close_icon = "󰅖",
                modified_icon = "●",
                close_icon = "",
                left_trunc_marker = "",
                right_trunc_marker = "",

                max_name_length = 20,
                max_prefix_length = 16,
                truncate_names = true,
                tab_size = 18,

                diagnostics = "nvim_lsp",
                diagnostics_update_in_insert = false,
                diagnostics_update_on_event = true,
                diagnostics_indicator = function(count, level, _, context)
                    if context.buffer:current() then
                        return ""
                    end
                    local icon = level:match("error") and " " or " "
                    return icon .. count
                end,

                color_icons = true,
                show_buffer_icons = true,
                show_buffer_close_icons = false,
                show_close_icon = false,
                show_tab_indicators = true,
                show_duplicate_prefix = false,
                duplicates_across_groups = true,

                persist_buffer_sort = true,
                move_wraps_at_ends = true,

                separator_style = "thin",
                enforce_regular_tabs = false,
                always_show_bufferline = true,
                auto_toggle_bufferline = false,

                hover = {
                    enabled = true,
                    delay = 180,
                    reveal = { "close" },
                },

                sort_by = "insert_after_current",

                offsets = {
                    {
                        filetype = "NvimTree",
                        text = "󰙅 Explorer",
                        text_align = "left",
                        separator = false,
                    },
                    {
                        filetype = "neo-tree",
                        text = "󰙅 Explorer",
                        text_align = "left",
                        separator = false,
                    },
                },

                pick = {
                    alphabet = "asdfjkl;ghnmxcvbziowerutyqpASDFJKLGHNMXCVBZIOWERUTYQP1234567890",
                },
            },

            highlights = {
                fill = {
                    bg = "NONE",
                },

                background = {
                    fg = "#928374",
                    bg = "NONE",
                },

                buffer_visible = {
                    fg = "#bdae93",
                    bg = "NONE",
                },

                buffer_selected = {
                    fg = "#fbf1c7",
                    bg = "#3c3836",
                    bold = true,
                    italic = false,
                },

                numbers = {
                    fg = "#7c6f64",
                    bg = "NONE",
                },
                numbers_visible = {
                    fg = "#7c6f64",
                    bg = "NONE",
                },
                numbers_selected = {
                    fg = "#ebdbb2",
                    bg = "#3c3836",
                    bold = true,
                },

                diagnostic = {
                    fg = "#928374",
                    bg = "NONE",
                },
                diagnostic_visible = {
                    fg = "#a89984",
                    bg = "NONE",
                },
                diagnostic_selected = {
                    fg = "#ebdbb2",
                    bg = "#3c3836",
                    bold = true,
                },

                hint = {
                    fg = "#8ec07c",
                    bg = "NONE",
                },
                hint_visible = {
                    fg = "#8ec07c",
                    bg = "NONE",
                },
                hint_selected = {
                    fg = "#8ec07c",
                    bg = "#3c3836",
                    bold = true,
                },

                info = {
                    fg = "#83a598",
                    bg = "NONE",
                },
                info_visible = {
                    fg = "#83a598",
                    bg = "NONE",
                },
                info_selected = {
                    fg = "#83a598",
                    bg = "#3c3836",
                    bold = true,
                },

                warning = {
                    fg = "#fabd2f",
                    bg = "NONE",
                },
                warning_visible = {
                    fg = "#fabd2f",
                    bg = "NONE",
                },
                warning_selected = {
                    fg = "#fabd2f",
                    bg = "#3c3836",
                    bold = true,
                },

                error = {
                    fg = "#fb4934",
                    bg = "NONE",
                },
                error_visible = {
                    fg = "#fb4934",
                    bg = "NONE",
                },
                error_selected = {
                    fg = "#fb4934",
                    bg = "#3c3836",
                    bold = true,
                },

                modified = {
                    fg = "#d79921",
                    bg = "NONE",
                },
                modified_visible = {
                    fg = "#d79921",
                    bg = "NONE",
                },
                modified_selected = {
                    fg = "#fabd2f",
                    bg = "#3c3836",
                },

                duplicate = {
                    fg = "#7c6f64",
                    bg = "NONE",
                    italic = true,
                },
                duplicate_visible = {
                    fg = "#7c6f64",
                    bg = "NONE",
                    italic = true,
                },
                duplicate_selected = {
                    fg = "#bdae93",
                    bg = "#3c3836",
                    italic = true,
                },

                separator = {
                    fg = "#504945",
                    bg = "NONE",
                },
                separator_visible = {
                    fg = "#504945",
                    bg = "NONE",
                },
                separator_selected = {
                    fg = "#665c54",
                    bg = "#3c3836",
                },

                indicator_visible = {
                    fg = "#665c54",
                    bg = "NONE",
                },
                indicator_selected = {
                    fg = "#d79921",
                    bg = "#3c3836",
                },

                pick = {
                    fg = "#fe8019",
                    bg = "NONE",
                    bold = true,
                },
                pick_visible = {
                    fg = "#fe8019",
                    bg = "NONE",
                    bold = true,
                },
                pick_selected = {
                    fg = "#fe8019",
                    bg = "#3c3836",
                    bold = true,
                },

                close_button = {
                    fg = "#7c6f64",
                    bg = "NONE",
                },
                close_button_visible = {
                    fg = "#928374",
                    bg = "NONE",
                },
                close_button_selected = {
                    fg = "#fb4934",
                    bg = "#3c3836",
                },

                trunc_marker = {
                    fg = "#7c6f64",
                    bg = "NONE",
                },

                offset_separator = {
                    fg = "NONE",
                    bg = "NONE",
                },
            },
        })
    end,
}