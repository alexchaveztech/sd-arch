local Plugin = {'lukas-reineke/indent-blankline.nvim'}

Plugin.name = 'indent_blankline'

Plugin.event = {'BufReadPost', 'BufNewFile'}

-- See :help indent-blankline-setup
Plugin.opts = {
  use_treesitter = true,
}

return Plugin
