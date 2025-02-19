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
        show_on_dirs = true,
      },
      on_attach = function(bufnr)
        local api = require "nvim-tree.api"

        local function opts(desc)
          return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
        end

        -- default mappings
        api.config.mappings.default_on_attach(bufnr)

        --custom mappings
        vim.keymap.set("n", "<leader>v", api.node.open.vertical,    opts("Open file in vertical split"))
        vim.keymap.set("n", "<leader>s", api.node.open.horizontal,  opts("Open file in horizontal split"))
      end,
    }
    vim.keymap.set('n', '<F9>', ':NvimTreeToggle<cr>', { desc = 'Toggle file tree' })
  end,
}

