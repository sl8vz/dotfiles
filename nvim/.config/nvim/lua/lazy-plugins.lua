-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
require('lazy').setup({
  'tpope/vim-sleuth',      -- Detect tabstop and shiftwidth automatically
  'tpope/vim-unimpaired',
  {
    'fedepujol/move.nvim',
    opts = {},
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
    end
  },
  'github/copilot.vim',
  { 'preservim/tagbar',      config = function() vim.g.tagbar_position = 'topleft vertical' end }, -- Display tags in a window

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  {'nvim-lualine/lualine.nvim', config = function() require('lualine').setup{} end, dependencies = { 'nvim-tree/nvim-web-devicons' }},

  require 'plugins/debug',
  require 'plugins/indent_line',
  require 'plugins/lint',
  require 'plugins/cmp',
  --  require 'plugins/conform',
  require 'plugins/filetree',
  require 'plugins/gitsigns',
  require 'plugins/gruvbox',
  require 'plugins/lspconfig',
  require 'plugins/mini',
  require 'plugins/telescope',
  require 'plugins/todo-comments',
  require 'plugins/treesitter',
  require 'plugins/which-key',
}, {
  ui = {
    -- If you are using a Nerd Font: set icons to an empty table which will use the
    -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
    icons = vim.g.have_nerd_font and {} or {
      cmd = '⌘',
      config = '🛠',
      event = '📅',
      ft = '📂',
      init = '⚙',
      keys = '🗝',
      plugin = '🔌',
      runtime = '💻',
      require = '🌙',
      source = '📄',
      start = '🚀',
      task = '📌',
      lazy = '💤 ',
    },
  },
})

-- vim: ts=2 sts=2 sw=2 et
