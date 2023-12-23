local Plugin = {'nvim-lualine/lualine.nvim'}

Plugin.name = 'lualine'

Plugin.event = 'VeryLazy'

Plugin.opts = {
  options = {
    theme = 'tokyonight',
    icons_enabled = true,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = {
      statusline = {'NvimTree'}
    }
  },
}

function Plugin.init()
  vim.opt.showmode = false
end

return Plugin
