return {
	{
    'uga-rosa/ccc.nvim',
    config = function ()
      local ccc = require('ccc')
      ccc.setup {
        inputs = {
          ccc.input.hsl,
          ccc.input.rgb,
          ccc.input.cmyk,
        },
        highlight_mode = "virtual",
        virtual_symbol = "▐██▌",
        virtual_pos = "inline-right",
      }
    end,
  },
}
