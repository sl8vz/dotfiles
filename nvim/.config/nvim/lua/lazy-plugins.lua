require('lazy').setup({
  'tpope/vim-sleuth',      -- Detect tabstop and shiftwidth automatically
  'tpope/vim-unimpaired',
  'github/copilot.vim',
  { 'preservim/tagbar',      config = function() vim.g.tagbar_position = 'topleft vertical' end }, -- Display tags in a window
  { 'numToStr/Comment.nvim', opts = {} },
  { 'FabijanZulj/blame.nvim', config = function() require("blame").setup() end, vim.keymap.set('n', '<F7>', ':BlameToggle<CR>', { desc = 'Toggle blame' })},
  { 'mrcjkb/rustaceanvim', version = '^5', lazy = false},
  { 'catppuccin/nvim', name = "catppuccin", priority = 1000, init = function () vim.cmd.colorscheme('catppuccin')  end },
  require 'plugins/cmp',
  require 'plugins/filetree',
  require 'plugins/gitsigns',
  require 'plugins/indent_line',
  require 'plugins/lint',
  require 'plugins/lspconfig',
  require 'plugins/lualine',
  require 'plugins/mini',
  require 'plugins/move',
  require 'plugins/telescope',
  require 'plugins/todo-comments',
  require 'plugins/tmux',
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
