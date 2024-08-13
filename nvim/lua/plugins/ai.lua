return {
  {
    'robitx/gp.nvim',
    opts = {
      openai_api_key = {'bw', 'get', 'password', 'gp.nvim_openai'},
      default_command_agent = 'CodeGPT4o-mini',
      default_chat_agent = 'ChatGPT4o-mini',
    },
    event = 'VeryLazy',
  },
}
