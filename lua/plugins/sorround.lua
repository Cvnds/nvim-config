return {
    'echasnovski/mini.nvim',
    version = false,
    config = function()
        require('mini.surround').setup({
            mappings = {
                add = 'sa',    -- Adicionar surround (Visual ou Motion)
                delete = 'sd', -- Deletar surround
                find = 'sf',   -- Encontrar surround
                find_left = 'sF',
                highlight = 'sh', -- Destacar surround
                replace = 'sr', -- Substituir surround
                update_n_lines = 'sn',
            },
        })
    end
}
