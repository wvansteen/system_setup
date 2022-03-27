local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
  -- My plugins here
	use {
		'akinsho/bufferline.nvim',
		requires = 'kyazdani42/nvim-web-devicons'
	}
	use {'akinsho/toggleterm.nvim'}
	use 'Mofiqul/dracula.nvim'
  use {
		'kyazdani42/nvim-tree.lua',
    requires = {
    	'kyazdani42/nvim-web-devicons',
    },
    config = function() require('nvim-tree').setup{} end
  }
	use {
		'lewis6991/gitsigns.nvim',
 	  requires = {
			'nvim-lua/plenary.nvim'
    },
  -- tag = 'release' -- To use the latest release
	}
	use 'lukas-reineke/indent-blankline.nvim'
	use 'neovim/nvim-lspconfig'
	use {
 	 	'nvim-lualine/lualine.nvim',
 	 	requires = { 
			'kyazdani42/nvim-web-devicons', opt = true 
		}
	}
	use { 
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}
  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)

