return {
  "mrcjkb/rustaceanvim",
  version = "^5",
  lazy = false,
  init = function()
    vim.g.rustaceanvim = {
      tools = {
        enable_clippy = false,
      },
      server = {
      on_attach = function(client, bufnr)
        end,
      },
    }
  end,
}
