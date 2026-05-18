return {
  {
    "nvim-treesitter/nvim-treesitter",
    branch = "main",
    build = ":TSUpdate",
    cmd = { "TSUpdate", "TSUpdateSync", "TSInstall", "TSInstallSync" },
    opts = {},
    init = function()
      require("nvim-treesitter").install({
        "asm",
        "bash",
        "c",
        "cmake",
        "cpp",
        "css",
        "csv",
        "diff",
        "dockerfile",
        "gdscript",
        "gdshader",
        "glsl",
        "html",
        "hyprlang",
        "ini",
        "java",
        "javascript",
        "jq",
        "json",
        "jsonnet",
        "latex",
        "lua",
        "make",
        "markdown",
        "markdown_inline",
        "nginx",
        "passwd",
        "python",
        "query",
        "regex",
        "rust",
        "sql",
        "tmux",
        "vim",
        "vimdoc",
        "xml",
        "yaml",
        "zig",
        "zsh",
      })

      vim.wo.foldmethod = "expr"
      vim.wo.foldexpr = "v:lua.vim.treesitter.foldexpr()"
    end,
    lazy = false,
    -- event = "VeryLazy",
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    opts = {
      enable = true,
      line_numbers = true,
      mode = 'cursor',
      max_lines = 6,
    },
    event = 'VeryLazy',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },

  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    branch = "main",
    init = function()
      -- Disable entire built-in ftplugin mappings to avoid conflicts.
      -- See https://github.com/neovim/neovim/tree/master/runtime/ftplugin for built-in ftplugins.
      vim.g.no_plugin_maps = false

      local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
      local xomap_select = function(keys, obj, query_group)
        vim.keymap.set({ "x", "o" }, keys, function() select_textobject(obj, query_group) end)
      end

      xomap_select("im", "@function.inner", "textobjects")
      xomap_select("am", "@function.outer", "textobjects")
      xomap_select("ic", "@class.inner", "textobjects")
      xomap_select("ac", "@class.outer", "textobjects")
      xomap_select("ia", "@parameter.inner", "textobjects")
      xomap_select("aa", "@parameter.outer", "textobjects")

      local swap_previous = require("nvim-treesitter-textobjects.swap").swap_previous
      local swap_next = require("nvim-treesitter-textobjects.swap").swap_next

      vim.keymap.set("n", "<leader>A", function() swap_previous("@parameter.outer") end)
      vim.keymap.set("n", "<leader>a", function() swap_next("@parameter.inner") end)

      local goto_prev_start = require("nvim-treesitter-textobjects.move").goto_previous_start
      local goto_prev_end = require("nvim-treesitter-textobjects.move").goto_previous_end
      local goto_next_start = require("nvim-treesitter-textobjects.move").goto_next_start
      local goto_next_end = require("nvim-treesitter-textobjects.move").goto_next_end

      local nxomap_moves = function(keys, obj, query_group)
        vim.keymap.set({ "n", "x", "o" }, "<leader>N" .. keys, function() goto_prev_start(obj, query_group) end)
        vim.keymap.set({ "n", "x", "o" }, "<leader>n" .. keys, function() goto_next_start(obj, query_group) end)
        vim.keymap.set({ "n", "x", "o" }, "<leader>E" .. keys, function() goto_prev_end(obj, query_group) end)
        vim.keymap.set({ "n", "x", "o" }, "<leader>e" .. keys, function() goto_next_end(obj, query_group) end)
      end

      nxomap_moves("=", "@assignment.outer", "textobjects")
      nxomap_moves("<", "@assignment.lhs", "textobjects")
      nxomap_moves(">", "@assignment.rhs", "textobjects")
      nxomap_moves("B", "@block.outer", "textobjects")
      nxomap_moves("ci", "@call.inner", "textobjects")
      nxomap_moves("co", "@call.outer", "textobjects")
      nxomap_moves("cc", "@call.outer", "textobjects")
      nxomap_moves("t", "@class.outer", "textobjects")
      nxomap_moves("x", "@comment.outer", "textobjects")
      nxomap_moves("b", "@conditional.outer", "textobjects")
      nxomap_moves("f", "@function.outer", "textobjects")
      nxomap_moves("l", "@loop.outer", "textobjects")
      nxomap_moves("v", "@number.inner", "textobjects")
      nxomap_moves("r", "@return.outer", "textobjects")
      nxomap_moves("s", "@statement.outer", "textobjects")

      local repeatable_move = require "nvim-treesitter-textobjects.repeatable_move"
      vim.keymap.set({ "n", "x", "o" }, "!", repeatable_move.repeat_last_move)
      vim.keymap.set({ "n", "x", "o" }, "§", repeatable_move.repeat_last_move_opposite)

      vim.keymap.set({ "n", "x", "o" }, "f", repeatable_move.builtin_f_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "F", repeatable_move.builtin_F_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "t", repeatable_move.builtin_t_expr, { expr = true })
      vim.keymap.set({ "n", "x", "o" }, "T", repeatable_move.builtin_T_expr, { expr = true })
    end,
    opts = {
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
}
