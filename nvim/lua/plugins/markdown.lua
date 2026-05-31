return {
  { 'godlygeek/tabular',            cmd = 'Tabularize' },

  {
    'plasticboy/vim-markdown',
    ft = 'markdown',
    init = function()
      vim.g.vim_markdown_no_default_key_mappings = 1
    end,
  },

  { 'iamcco/markdown-preview.nvim', ft = 'markdown' },

  {
    "dhruvasagar/vim-table-mode",
    event = "VeryLazy",
    ft = { "markdown", "txt" },
    init = function()
      vim.g.table_mode_corner = "|"
    end,
  },
}
