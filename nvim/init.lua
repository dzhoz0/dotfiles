require('options')
require('plugins')
require('colorscheme')
require('keymaps')

-- LSP and CMP setup
require('lsp-setup').setup({
    servers = {
        ["clangd"] = {}
    }
})

local cmp_status, cmp = pcall(require, "cmp")
if not cmp_status then
  return
end

cmp.setup {
  sources = {
    { name = 'nvim_lsp' }, { name = 'snippy'}, { name = 'buffer'}, { name = 'path' }
  },
  snippet = {
    expand = function(args)
      require 'snippy'.expand_snippet(args.body)
    end
  }, 
  mapping = cmp.mapping.preset.insert({
    ["<Up>"] = cmp.mapping.select_prev_item(), -- previous suggestion
    ["<Down>"] = cmp.mapping.select_next_item(), -- next suggestion
    ["<C-Up>"] = cmp.mapping.scroll_docs(-4),
    ["<C-Down>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
    ["<C-e>"] = cmp.mapping.abort(), -- close completion window
    ["<CR>"] = cmp.mapping.confirm({ select = false }),
  }),
}
-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require("luasnip.loaders.from_vscode").lazy_load()
-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
-- END OF SETUP
--

vim.cmd [[
    augroup fmt
        autocmd!
        autocmd BufWritePre * undojoin | Neoformat
    augroup END
]]


vim.cmd [[
    set autoread
    autocmd FocusGained,BufEnter,CursorHold,CursorHoldI * if mode() != 'c' | checktime | endif
    autocmd FileChangedShellPost *
        \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None
]]

require("telescope").load_extension("session-lens")
require('Comment').setup()
