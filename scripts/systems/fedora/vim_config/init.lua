local o = vim.o
local wo = vim.wo
local bo = vim.bo
local set = vim.opt

vim.g.mapleader = ','
vim.g.maplocalleader = ','
vim.g.python3_host_prog ='/usr/bin/python'

o.autoread = true
o.termguicolors = true
o.showmode = true
o.laststatus = 2
o.ruler = true
o.splitright = true
o.scrolloff = 3
o.sidescrolloff = 15
o.hidden = true
o.encoding = 'utf-8'
o.inccommand = 'nosplit'
o.hlsearch = true
o.ignorecase = true
o.smartcase = true
o.updatetime = 1000
o.tabstop = 2
o.shiftwidth = 2

wo.number = true
wo.relativenumber = false
wo.colorcolumn = '120'
wo.foldmethod = 'syntax'
wo.foldenable = false

bo.swapfile = false
bo.expandtab = false
bo.fileencoding = 'utf-8'
bo.textwidth = 120
bo.smartindent = true

set.undofile = false
set.termguicolors = true

vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
  ]],
    false
)

require('plugins')
