-- Set leader key to Space
vim.g.mapleader = " "
-- Insert mode mappings for brackets
vim.keymap.set("i", "(<CR>", "(<CR>)<Esc>O", { noremap = true })
vim.keymap.set("i", "{<CR>", "{<CR>}<Esc>O", { noremap = true })
vim.keymap.set("i", "[<CR>", "[<CR>]<Esc>O", { noremap = true })


-- Plugin manager configuration
local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.local/share/nvim/plugged")

Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { tag = '0.1.8' })
Plug ("nvim-treesitter/nvim-treesitter", { ['do'] = ':TSUpdate'})
Plug("prettier/vim-prettier", {
  ["do"] = "npm install --frozen-lockfile --production",
  ["for"] = { "javascript", "typescript", "css", "less", "scss", "json", "graphql", "markdown", "vue", "svelte", "yaml", "html" }
})

Plug ("ayu-theme/ayu-vim")
Plug ("projekt0n/github-nvim-theme")

vim.call("plug#end")


-- General Settings

vim.opt.termguicolors = true
vim.g.ayucolor = "dark"
vim.cmd('colorscheme ayu')

vim.o.number = true         -- Show line numbers
vim.o.relativenumber = true -- Show relative line numbers
-- Open Netrw in the current directory
vim.api.nvim_set_keymap('n', '<Leader>e', ':Explore<CR>', { noremap = true, silent = true })

-- Open Netrw in a vertical split
vim.api.nvim_set_keymap('n', '<Leader>ve', ':Vexplore<CR>', { noremap = true, silent = true })

-- Open Netrw in a horizontal split
vim.api.nvim_set_keymap('n', '<Leader>se', ':Sexplore<CR>', { noremap = true, silent = true })

-- Normal mode mappings
vim.keymap.set("n", "<leader>w", ":w<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tabn", ":tabnew<CR>", { noremap = true, silent = true }) -- Avoid conflict
vim.keymap.set("n", "<leader>tc", ":tabclose<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tp", ":tabprev<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "<leader>tn", ":tabnext<CR>", { noremap = true, silent = true })

-- Telescope key mappings
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope find buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- Telescope configuration (optional but recommended)
require('telescope').setup {
    defaults = {
        mappings = {
            i = {
                ["<C-j>"] = "move_selection_next",
                ["<C-k>"] = "move_selection_previous",
            },
        },
	file_ignore_patterns = {
		"node_modules",
	},
    },
}


require'nvim-treesitter.configs'.setup {
  ensure_installed = { "css","html","javascript", "typescript", "tsx", "c", "lua" },  -- Install parsers for React (TSX), TypeScript, and C
  sync_install = false,  -- Install parsers asynchronously
  highlight = {
    enable = true,  -- Enable syntax highlighting
    additional_vim_regex_highlighting = false,  -- Disable vim regex highlighting for better performance
  },
  indent = {
    enable = true,  -- Enable indentation
  },
}

