return {
  {
    'nvim-treesitter/nvim-treesitter',
    config = function ()
      require('nvim-treesitter.configs').setup {
        -- A list of parser names, or "all" (the listed parsers MUST always be installed)
        ensure_installed = {
          "c",
          "cpp",
          "python",
          "rust",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "markdown",
          "markdown_inline",
          "yaml",
          "bash",
          "glsl",
          "cmake",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,

        -- Automatically install missing parsers when entering buffer
        -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
        auto_install = true,

        ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
        -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!
        -- parser_install_dir = "/some/path/to/store/parsers",

        highlight = {
          enable = true,
        },
      }

      vim.cmd('TSUpdate')
    end,
    event = 'VeryLazy',
  },
}
