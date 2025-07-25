-- [[ Configure LSP ]]
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
  -- disable semantic tokens
  -- client.server_capabilities.semanticTokensProvider = nil

  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>gd', vim.lsp.buf.definition, 'Goto definition')
  nmap('<leader>gD', vim.lsp.buf.declaration, 'Goto declaration')
  nmap('<leader>gs', vim.lsp.buf.document_symbol, 'Document symbols')
  nmap('<leader>gr', vim.lsp.buf.references, 'List references')
  nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')

  nmap('<leader>g<space>', vim.lsp.buf.code_action, 'Code action')

  nmap('K', vim.lsp.buf.hover, 'Hover documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')
  nmap('<leader>gn', vim.diagnostic.goto_next, 'Next diagnostic')
  nmap('<leader>gN', vim.diagnostic.goto_prev, 'Previous diagnostic')
  nmap('<leader>ss', vim.cmd.ClangdSwitchSourceHeader, 'Switch source/header')

  nmap('<leader>gf', function()
    vim.diagnostic.goto_next()
    vim.lsp.buf.code_action()
  end, 'Code action')

  vim.keymap.set('n', '<leader>lr', ':LspRestart<CR>', { silent = false })
  vim.keymap.set('n', '<leader>ls', ':LspStop<CR>', { silent = false })

  -- if client:supports_method("textDocument/signatureHelp") then
  --   require('lsp-overloads').setup(client, {
  --     ui = {
  --       max_height = 12,
  --       max_width = 85,
  --       offset_y = 0,
  --       close_events = { "CursorMoved", "BufHidden", "InsertLeave", "InsertCharPre" },
  --     },
  --     keymaps = {
  --       next_signature = '<down>',
  --       previous_signature = '<up>',
  --     }
  --   })
  --   -- issue: seems to break :ClangdSwitchSourceHeader (?)
  --   -- vim.api.nvim_set_keymap('n', '<A-s>', ':LspOverloadsSignature<CR>', { noremap = true, silent = true, buffer = bufnr })
  -- end
end


vim.api.nvim_create_autocmd("LspAttach", {
  group = vim.api.nvim_create_augroup("cfy.lsp", {}),
  callback = on_attach,
})

require('mason').setup()

local servers = {
  bashls = {},
  clangd = {
    cmd = { "clangd", "--clang-tidy" },
  },
  -- cmake = {},
  dockerls = {},
  docker_compose_language_service = {},
  lua_ls = {
    prefix = "Lua",
    settings = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
  pyright = {
    settings = {
      analysis = {
        autoSearchPaths = true,
        useLibraryCodeForTypes = true,
        typeCheckingMode = 'off',
        diagnosticMode = 'openFilesOnly',
        diagnosticSeverityOverrides = {
        },
      },
    },
  },
  -- pylsp = {
  -- 	settings = {
  -- 		plugins = {
  -- 			pycodestyle = {
  -- 				ignore = {'E221', 'E226', 'E251', 'E266', 'W191'}
  -- 			}
  -- 		}
  -- 	}
  -- },
  -- texlab = {},
  rust_analyzer = {
    prefix = 'rust-analyzer',
    settings = {
      imports = {
        granularity = {
          group = "module",
        },
        prefix = "self",
      },
      cargo = {
        buildScripts = {
          enable = true,
        },
      },
      procMacro = {
        enable = true
      },
    }
  },
  -- ltex = {
  -- autostart = false,
  --   settings = {
  --     additionalRules = {
  --       enablePickyRules = true,
  --       motherTongues = 'fr',
  --     },
  --   },
  -- },
}

vim.diagnostic.config({
  -- virtual_text = { severity = { max = vim.diagnostic.severity.WARN } },
  -- virtual_lines = { severity = { min = vim.diagnostic.severity.ERROR } },
  virtual_text = true,
  virtual_lines = false,
  underline = true,
  update_in_insert = false,
})

-- local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
  automatic_enable = false,
}
-- mason_lspconfig.setup_handlers {
-- 	function(server_name)
-- 		local server = servers[server_name] or {}
-- 		local prefix = server.prefix or server_name
-- 		local autostart = true
--
-- 		if server.autostart ~= nil then
-- 			autostart = server.autostart
-- 		end
--
-- 		require('lspconfig')[server_name].setup {
-- 			cmd = server.cmd,
-- 			autostart = autostart,
-- 			capabilities = capabilities,
-- 			on_attach = on_attach,
-- 			settings = {[prefix] = server.settings},
-- 			filetypes = server.filetypes,
-- 		}
-- 	end,
-- }

for server, config in pairs(servers) do
  local prefix = server.prefix or server
  local autostart = true
  if config.autostart ~= nil then
    autostart = config.autostart
  end
  vim.lsp.config(server, {
    autostart = autostart,
    capabilities = require('blink.cmp').get_lsp_capabilities(config.capabilities),
    settings = { [prefix] = config.settings }
  })
  vim.lsp.enable(server)
end

-- local cmp = require('cmp')
-- local luasnip = require('luasnip')
-- require('luasnip.loaders.from_vscode').lazy_load()
-- luasnip.config.setup{}
--
-- cmp.setup{
--   snippet = {
--     expand = function(args)
--       luasnip.lsp_expand(args.body)
--     end,
--   },
--   completion = {
--     completeopt = 'menu,menuone,noinsert',
--   },
--   mapping = cmp.mapping.preset.insert {
--     ['<down>'] = cmp.mapping.select_next_item(),
--     ['<up>'] = cmp.mapping.select_prev_item(),
--     ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--     ['<C-f>'] = cmp.mapping.scroll_docs(4),
--     ['<C-Space>'] = cmp.mapping.complete{},
--     ['<CR>'] = cmp.mapping.confirm{
--       behavior = cmp.ConfirmBehavior.Insert,
--       select = true,
--     },
--     ['<Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_next_item()
--       elseif luasnip.expand_or_locally_jumpable() then
--         luasnip.expand_or_jump()
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--     ['<S-Tab>'] = cmp.mapping(function(fallback)
--       if cmp.visible() then
--         cmp.select_prev_item()
--       elseif luasnip.locally_jumpable(-1) then
--         luasnip.jump(-1)
--       else
--         fallback()
--       end
--     end, { 'i', 's' }),
--   },
--   sources = {
--     {name = 'nvim_lsp'},
--     {name = 'luasnip'},
--     {name = 'path'},
--   },
--   window = {
--     documentation = {
--       max_height = 10,
--     },
--   },
--   view = {
--     docs = {
--       auto_open = false
--     },
--   },
-- }

-- require('lint').linters_by_ft = {
--   -- python = { 'ruff' }
-- }
