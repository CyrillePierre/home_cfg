if os.getenv("TMUX") and not (os.getenv("SSH_CLIENT") or os.getenv("SSH_TTY") or os.getenv("SSH_CONNECTION")) then
	--- tmux.conf: 'set-option -g allow-passthrough on'
	local original_ui_send = vim.api.nvim_ui_send

	--- TODO: this implementation works only if there is exactly one escape sequence as first char
	local function wrap_tmux(content) return string.format("\27Ptmux;\27%s\27\\", content) end

	--- @diagnostic disable-next-line: duplicate-set-field
	vim.api.nvim_ui_send = function(content) original_ui_send(wrap_tmux(content)) end
end
