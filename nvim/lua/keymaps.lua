local opts = {
    noremap = true,      -- non-recursive
    silent = true,       -- do not show message
}

vim.g.mapleader = " "

-- telescope

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
vim.keymap.set('n', '<leader>aa', 'ggVG', {noremap = true})

vim.cmd [[
    nnoremap <leader>bb :w <bar> exec '!g++ % -std=c++17 -o cpbin -Wall -DLOCAL -O2 && time ./cpbin'<CR>
    tnoremap <Esc> <C-\><C-n>
]]
