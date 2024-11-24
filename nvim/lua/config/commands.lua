vim.api.nvim_create_user_command('Bd', 'bp|bd#', {})
vim.api.nvim_create_user_command('Rmargin', ToggleRightMargin, {nargs = '?'})
vim.api.nvim_create_user_command("BwUnlock", InteractiveBwUnlock, {})
