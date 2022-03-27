local map = vim.api.nvim_set_keymap
local noremap = {noremap = true}

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>', noremap)
map('n', '<leader>r', ':NvimTreeRefresh<CR>', noremap)
map('n', '<leader>n', ':NvimTreeFindFile<CR>', noremap)

-- BufferLine
map('n', '<C-S-0>', ':BufferLineCycleNext<CR>', noremap)
map('n', '<C-S-9>', ':BufferLineCyclePrev<CR>', noremap)
