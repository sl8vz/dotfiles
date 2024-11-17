return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    config = function()
      vim.g.rustaceanvim = {
        -- Plugin configuration
        tools = {
        },
        -- LSP configuration
        server = {
          on_attach = function(client, bufnr)
            -- you can also put keymaps in here
          end,
          default_settings = {
            -- rust-analyzer language server configuration
            ['rust-analyzer'] = {
            },
          },
          cmd = function()
            return {'ra-multiplex'}
          end,
        },
        -- DAP configuration
        dap = {
        },
      }
      end,
  },
}

