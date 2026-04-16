
-- clipboard
vim.opt.clipboard = "unnamedplus"
vim.g.mapleader = " "
vim.opt.wrap = false
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.cmdheight  = 1

-- suport WSL
local is_wsl = vim.fn.has("wsl") == 1

if is_wsl then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe -c [Console]::Out.Write((Get-Clipboard -Raw).ToString())",
      ["*"] = "powershell.exe -c [Console]::Out.Write((Get-Clipboard -Raw).ToString())",
    },
    cache_enabled = 0,
  }
end

-- stuff
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = 'a'

--Tab
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--UI
vim.opt.number = true
-- vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.splitbelow = true
vim.opt.splitright = true
-- vim.opt.showmode = false

-- Search

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true


