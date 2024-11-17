-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setqflist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<left>', '<<', { desc = 'Shift line left' })
vim.keymap.set('n', '<right>', '>>', { desc = 'Shift line right' })

-- Keybinds to make split navigation easier.
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Split windows easily
vim.keymap.set('n', '<leader>s', '<cmd>split<CR>', { desc = 'Split window horizontally' })
vim.keymap.set('n', '<leader>v', '<cmd>vsplit<CR>', { desc = 'Split window vertically' })

--The jj escape from insert mode
vim.keymap.set('i', 'jj', '<Esc>', { desc = 'Escape from insert mode with jj' })

-- Fast navigate
vim.keymap.set('n', '<S-j>', '4<C-e>', { desc = 'Move down by 4 lines' })
vim.keymap.set('n', '<S-k>', '4<C-y>', { desc = 'Move up by 4 lines' })

-- Toggle tagbar
vim.keymap.set('n', '<F8>', '<cmd>TagbarToggle<CR>', { desc = 'Toggle [T]agbar' })

-- Save
vim.keymap.set('n', '<leader>w', '<cmd>write<CR>', { desc = 'Save file' })

-- Close buffer and windowj
vim.keymap.set('n', '<leader>z', '<cmd>BufferClose<CR>', { desc = 'Close buffer' })
vim.keymap.set('n', '<leader>c', '<cmd>close<CR>', { desc = 'Close window' })

-- Toggle QuickFix
vim.keymap.set('n', '<F1>', '<cmd>lua ToggleQuickFix()<CR>', { desc = 'Toggle [Q]uickFix' })

-- Toggle Loclist
vim.keymap.set('n', '<F2>', '<cmd>lua ToggleLocList()<CR>', { desc = 'Toggle [L]oclist' })

-- Unmap s
vim.keymap.set('n', 's', '<Nop>', { desc = 'Unmap s' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

function ToggleQuickFix()
	if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.quickfix")) == 1 then
		vim.cmd([[copen]])
	else
		vim.cmd([[cclose]])
	end
end

function ToggleLocList()
  if vim.fn.empty(vim.fn.filter(vim.fn.getwininfo(), "v:val.loclist")) == 1 then
    vim.cmd([[lopen]])
  else
    vim.cmd([[lclose]])
  end
end

-- Reload files autocommand on autofocus, write, and BufWinEnter
vim.api.nvim_create_autocmd({'FocusGained','BufEnter','CursorHold','CursorHoldI'}, {
  desc = 'Reload files autocommand',
  group = vim.api.nvim_create_augroup('kickstart-reload-files', { clear = true }),
  pattern = '*',
  callback = function()
    vim.cmd([[checktime]])
  end,
})

-- vim: ts=2 sts=2 sw=2 et
