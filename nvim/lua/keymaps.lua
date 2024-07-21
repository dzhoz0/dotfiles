local opts = {
    noremap = true,
    silent = true
}
-- vim.keymap.set('n', '<leader>aa', 'cprun', opts)

vim.keymap.set('n', '<a-w>', ':w <bar> exec \'!g++ % -std=c++17 -o cpbin -Wall -DLOCAL -O2 && time ./cpbin\'<CR>')
vim.keymap.set('n', '<a-a>', ':w !clip.exe<CR><CR>')
