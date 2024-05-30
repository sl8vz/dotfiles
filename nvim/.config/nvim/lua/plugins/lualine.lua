return {
  "nvim-lualine/lualine.nvim",
  version = "*",
  lazy = false,
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  config = function()
    require("lualine").setup {
      options = {
        globalstatus = true,
      },
      sections = {
        lualine_c = {
          {
            "filename",
            path = 1,
          },
        },
        lualine_z = {
          "location",
          {
          "datetime",
           style = "%H:%M",
          },
        },
      },
    }
  end,
}
