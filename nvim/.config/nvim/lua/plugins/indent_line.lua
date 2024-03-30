return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    main = 'ibl',
    config = function()
      require('ibl').setup {
        enabled = false,
      }
      vim.keymap.set('n', '<F4>', ':IBLToggle<cr>', { desc = 'Toggle indent line' })
    end,
  },
}
