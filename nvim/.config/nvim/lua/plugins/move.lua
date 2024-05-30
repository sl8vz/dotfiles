return {
  "fedepujol/move.nvim",
  version = "*",
  lazy = false,
  config = function()
    require('move').setup {
      line = {
        enable = true, -- Enables line movement
        indent = true  -- Toggles indentation
      },
      block = {
        enable = true, -- Enables block movement
        indent = true  -- Toggles indentation
      },
      word = {
        enable = true, -- Enables word movement
      },
      char = {
        enable = true -- Enables char movement
      }
    }
    local opts = { noremap = true, silent = true }
    -- Normal-mode commands
    vim.keymap.set('n', '<Down>', ':MoveLine(1)<CR>', opts)
    vim.keymap.set('n', '<Up>', ':MoveLine(-1)<CR>', opts)

    -- Visual-mode commands
    vim.keymap.set('v', '<Down>', ':MoveBlock(1)<CR>', opts)
    vim.keymap.set('v', '<Up>', ':MoveBlock(-1)<CR>', opts)
    vim.keymap.set('v', '<Left>', ':MoveHBlock(-1)<CR>', opts)
    vim.keymap.set('v', '<Right>', ':MoveHBlock(1)<CR>', opts)
  end,
}
