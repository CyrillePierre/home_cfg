-- [[ Configure LSP ]]
-- This function gets run when an LSP connects to a particular buffer.
local on_attach = function(client, bufnr)
	-- disable semantic tokens
	client.server_capabilities.semanticTokensProvider = nil

	local nmap = function(keys, func, desc)
		if desc then
			desc = 'LSP: ' .. desc
		end

		vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
	end

	nmap('<leader>gd', vim.lsp.buf.declaration, 'Goto declaration')
	nmap('<leader>gD', vim.lsp.buf.definition, 'Goto definition')
	nmap('<leader>gs', vim.lsp.buf.document_symbol, 'Document symbols')
	nmap('<leader>gr', vim.lsp.buf.references, 'List references')
	nmap('<leader>rn', vim.lsp.buf.rename, 'Rename')
	nmap('<leader>g<space>', function()
		vim.lsp.buf.code_action { context = { only = { 'quickfix', 'refactor', 'source' } } }
	end, 'Code action')
	nmap('K', vim.lsp.buf.hover, 'Hover documentation')
	nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature documentation')
	nmap('<leader>gn', vim.diagnostic.goto_next, 'Next diagnostic')
	nmap('<leader>gN', vim.diagnostic.goto_prev, 'Previous diagnostic')
	nmap('<leader>ss', vim.cmd.ClangdSwitchSourceHeader, 'Switch source/header')

  vim.keymap.set('n', '<leader>lr', ':LspRestart<CR>', {silent = false})
  vim.keymap.set('n', '<leader>ls', ':LspStop<CR>', {silent = false})

	if client.server_capabilities.signatureHelpProvider then
		require('lsp-overloads').setup(client, {
			keymaps = {
				next_signature = '<down>',
				previous_signature = '<up>',
			}
		})
		-- issue: seems to break :ClangdSwitchSourceHeader (?)
		-- vim.api.nvim_set_keymap('n', '<A-s>', ':LspOverloadsSignature<CR>', { noremap = true, silent = true, buffer = bufnr })
	end
end

require('mason').setup()
require('mason-lspconfig').setup()

local servers = {
	bashls = {},
	clangd = {},
	cmake = {},
	dockerls = {},
	docker_compose_language_service = {},
	lua_ls = {
		Lua = {
			workspace = {checkThirdParty = false},
			telemetry = {enable = false},
		},
	},
	pylsp = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = {'E221', 'E226', 'E251', 'E266', 'W191'}
				}
			}
		}
	},
	texlab = {},
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

local mason_lspconfig = require('mason-lspconfig')
mason_lspconfig.setup {
	ensure_installed = vim.tbl_keys(servers),
}
mason_lspconfig.setup_handlers {
	function(server_name)
		require('lspconfig')[server_name].setup {
			capabilities = capabilities,
			on_attach = on_attach,
			settings = servers[server_name],
			filetypes = (servers[server_name] or {}).filetypes,
		}
	end,
}

local cmp = require('cmp')
local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup{}

cmp.setup{
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	completion = {
		completeopt = 'menu,menuone,noinsert',
	},
	mapping = cmp.mapping.preset.insert {
		['<down>'] = cmp.mapping.select_next_item(),
		['<up>'] = cmp.mapping.select_prev_item(),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete{},
		['<CR>'] = cmp.mapping.confirm{
			behavior = cmp.ConfirmBehavior.Insert,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expand_or_locally_jumpable() then
				luasnip.expand_or_jump()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.locally_jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, { 'i', 's' }),
	},
	sources = {
		{name = 'nvim_lsp'},
		{name = 'luasnip'},
		{name = 'path'},
	},
}
