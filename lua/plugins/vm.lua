return {
    {
        "mg979/vim-visual-multi",
        branch = "master",
        init = function()
            -- Force case sensitivity for Multi-Cursor
            vim.g.VM_case_setting = 'sensitive'
        end,
    },
}
