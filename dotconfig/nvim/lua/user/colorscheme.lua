-- ========================================================================== --
-- ==                           COLOR SCHEME                               == --
-- ========================================================================== --
local colorscheme = 'tokyonight'

require("tokyonight").setup({
  style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
 })

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
	vim.notify("colorscheme " .. colorscheme .. " not found!")
	return
end
