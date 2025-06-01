return {
  "mrcjkb/rustaceanvim",
  version = "^6",
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      tools = {
        enable_clippy = false,
      },
      server = {
        on_attach = function(client, bufnr)
        end,
        default_settings = {
          -- rust-analyzer language server configuration
          ['rust-analyzer'] = {
            cargo = {
              allFeatures = true,
            },
            cfg = {
              setTest = false,
            },
          },
        },
      },
    }
  end,
}
