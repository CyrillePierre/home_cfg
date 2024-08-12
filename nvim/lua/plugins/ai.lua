return {
  {
    'robitx/gp.nvim',
    opts = {
      openai_api_key = {'bw', 'get', 'password', 'gp.nvim_openai'},
    },
    event = 'VeryLazy',
  },
}
