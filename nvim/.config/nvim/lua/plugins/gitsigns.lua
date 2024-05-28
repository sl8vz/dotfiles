-- Here is a more advanced example where we pass configuration
-- options to `gitsigns.nvim`. This is equivalent to the following Lua:
--    require('gitsigns').setup({ ... })
--
-- See `:help gitsigns` to understand what the configuration keys do
return {
  { -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup {
        signs = {
          add = { text = '+' },
          change = { text = '~' },
          delete = { text = '_' },
          topdelete = { text = '‾' },
          changedelete = { text = '~' },
        },
      }

      vim.keymap.set('n', '<leader>hn', ':Gitsigns next_hunk<cr>', { desc = 'Next git hunk' })
      vim.keymap.set('n', '<leader>hp', ':Gitsigns prev_hunk<cr>', { desc = 'Previous git hunk' })
      vim.keymap.set('n', '<leader>hu', ':Gitsigns reset_hunk<cr>', { desc = 'Reset git hunk' })
      vim.keymap.set('n', '<leader>gR', ':Gitsigns reset_buffer<cr>', { desc = 'Reset git buffer' })
      vim.keymap.set('n', '<leader>hs', ':Gitsigns stage_hunk<cr>', { desc = 'Stage git hunk' })
      vim.keymap.set('n', '<leader>hS', ':Gitsigns undo_stage_hunk<cr>', { desc = 'Undo stage git hunk' })
      vim.keymap.set('n', '<leader>hb', ':Gitsigns blame_line<cr>', { desc = 'Blame git line' })

    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
