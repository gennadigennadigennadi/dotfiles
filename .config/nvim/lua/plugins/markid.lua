return {
    'David-Kunz/markid',
    config = function()
        m = require 'markid'
        m.queries = {
            default = '(identifier) @markid',
            php = [[
                (variable_name) @markid
            ]]
        }

        require 'nvim-treesitter.configs'.setup {
            markid = {
                enable = true,
                colors = m.colors.medium,
                queries = m.queries,
            }
        }
    end
}
