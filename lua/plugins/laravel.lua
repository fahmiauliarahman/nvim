 return {
   -- Laravel.nvim - Artisan commands, routes, models, views navigation
   {
     "adalessa/laravel.nvim",
     dependencies = {
       "tpope/vim-dotenv",
       "nvim-telescope/telescope.nvim",
       "MunifTanjim/nui.nvim",
       "kevinhwang91/promise-async",
     },
     cmd = { "Laravel" },
     keys = {
       { "<leader>la", ":Laravel artisan<cr>", desc = "Laravel Artisan" },
       { "<leader>lr", ":Laravel routes<cr>", desc = "Laravel Routes" },
       { "<leader>lm", ":Laravel related<cr>", desc = "Laravel Related" },
     },
     event = { "VeryLazy" },
     opts = {},
     config = true,
   },

   -- Blade syntax and LSP support
   {
     "jwalton512/vim-blade",
     ft = "blade",
   },
 }
