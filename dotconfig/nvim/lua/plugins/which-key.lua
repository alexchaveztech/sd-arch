local Plugin = {'folke/which-key.nvim'}

Plugin.name = 'which-key'

Plugin.event = 'VeryLazy'

Plugin.opts = {}


function Plugin.init()
  vim.o.timeout = true
  vim.o.timeoutlen = 300
end

return Plugin
