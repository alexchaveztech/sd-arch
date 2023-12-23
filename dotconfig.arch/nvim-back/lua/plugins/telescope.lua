local Plugin = {'nvim-telescope/telescope.nvim'}

Plugin.tag = '0.1.1'

Plugin.dependencies = {
  {'nvim-lua/plenary.nvim'},
  {'nvim-telescope/telescope-fzf-native.nvim', build = 'make'},
}

Plugin.cmd = {'Telescope'}

function Plugin.config()
  require('telescope').load_extension('fzf')
end

return Plugin

