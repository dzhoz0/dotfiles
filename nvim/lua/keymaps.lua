local opts = {
    noremap = true,
    silent = true
}
-- vim.keymap.set('n', '<leader>aa', 'cprun', opts)

vim.keymap.set('n', '<a-w>', ':w <bar> exec \'!g++ % -std=c++17 -o cpbin -Wall -DLOCAL -O2 && time ./cpbin\'<CR>')
vim.keymap.set('n', '<a-a>', 'ggVG')
vim.keymap.set('t', '<Esc>', '<C-\\><C-n><CR>')

-- Resize windows
vim.keymap.set('n', '+', ':res +5<CR>')
vim.keymap.set('n', '-', ':res -5<CR>')

-- move.nvim
local opts = { noremap = true, silent = true }
-- Normal-mode commands
vim.keymap.set('n', '<A-Down>', ':MoveLine(1)<CR>', opts)
vim.keymap.set('n', '<A-Up>', ':MoveLine(-1)<CR>', opts)
vim.keymap.set('n', '<A-Left>', ':MoveHChar(-1)<CR>', opts)
vim.keymap.set('n', '<A-Right>', ':MoveHChar(1)<CR>', opts)
vim.keymap.set('n', '<leader>wf', ':MoveWord(1)<CR>', opts)
vim.keymap.set('n', '<leader>wb', ':MoveWord(-1)<CR>', opts)

-- Visual-mode commands
vim.keymap.set('v', '<A-Down>', ':MoveBlock(1)<CR>', opts)
vim.keymap.set('v', '<A-Up>', ':MoveBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-Left>', ':MoveHBlock(-1)<CR>', opts)
vim.keymap.set('v', '<A-Right>', ':MoveHBlock(1)<CR>', opts)
