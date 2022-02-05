return require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    use 'neovim/nvim-lspconfig'

    use 'rust-lang/rust.vim'
    use 'shougo/vinarise.vim'
end)
