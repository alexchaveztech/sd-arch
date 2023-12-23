local Plugin = {'nvim-tree/nvim-tree.lua'}

Plugin.name = 'nvim-tree'

Plugin.cmd = {'NvimTreeToggle'}

-- See :help nvim-tree-setup
Plugin.opts = {
  sort_by = 'case_sensitive',
  renderer = {
    icons = {
      glyphs = {
        folder = {
          arrow_closed = "", -- arrow when folder is closed
          arrow_open = "", -- arrow when folder is open
        },
      },
    },
  },
  actions = {
    open_file = {
      window_picker = {
        enable = false,
      },
    },
  },

}

function Plugin.init()
  vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])	-- change arrow collor
end

return Plugin
