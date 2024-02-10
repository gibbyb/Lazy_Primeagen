require("theprimeagen.lazy")
require("theprimeagen.remap")
require("theprimeagen.set")
require("theprimeagen.colors")
require("theprimeagen.cloak")
require("theprimeagen.fugitive")
require("theprimeagen.harpoon")
require("theprimeagen.lsp")
require("theprimeagen.refactoring")
require("theprimeagen.telescope")
require("theprimeagen.treesitter")
require("theprimeagen.trouble")
require("theprimeagen.undotree")
require("theprimeagen.zenmode")

-- DO NOT INCLUDE THIS
vim.opt.rtp:append("~/personal/streamer-tools")
-- DO NOT INCLUDE THIS

local augroup = vim.api.nvim_create_augroup
local ThePrimeagenGroup = augroup('ThePrimeagen', {})

local autocmd = vim.api.nvim_create_autocmd
local yank_group = augroup('HighlightYank', {})

function R(name)
    require("plenary.reload").reload_module(name)
end

autocmd('TextYankPost', {
    group = yank_group,
    pattern = '*',
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 40,
        })
    end,
})

autocmd({"BufWritePre"}, {
    group = ThePrimeagenGroup,
    pattern = "*",
    command = [[%s/\s\+$//e]],
})

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
