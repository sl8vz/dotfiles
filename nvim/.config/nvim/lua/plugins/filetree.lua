-- File: lua/custom/plugins/filetree.lua
return {
  "nvim-tree/nvim-tree.lua",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("nvim-tree").setup {
      disable_netrw = true,
      hijack_netrw = true,
      update_focused_file = {
        enable = true,
        update_cwd = false,
        ignore_list = {},
      },
      system_open = {
        cmd = nil,
        args = {},
      },
      view = {
        width = 30,
        side = "right",
      },
      diagnostics = {
        enable = true,
      },
    }
    vim.keymap.set('n', '<F9>', ':NvimTreeToggle<cr>', { desc = 'Toggle file tree' })
  end,
}
