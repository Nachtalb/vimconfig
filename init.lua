-- Python host prog (from your basic.vim)
vim.g.python3_host_prog = '/usr/sbin/python' -- init.lua

-- Set session options recommended by auto-session
vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader key before lazy
vim.g.mapleader = ","
vim.g.maplocalleader = " "

-- Load core configurations
require("core.options")
require("core.keymaps")
require("core.autocmds")

-- Setup lazy.nvim
require("lazy").setup({
    spec = {
        { import = "plugins" }, -- This will import all plugins from lua/plugins/*.lua
    },
    install = {
        colorscheme = { "habamax" } -- Default colorscheme until everything is installed
    },
    checker = {
        enabled = true, -- Automatically check for plugin updates
        notify = false, -- Don't notify about updates
    },
    change_detection = {
        notify = false, -- Don't notify about config changes
    },
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip",
                "matchit",
                "matchparen",
                "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})


-- -- Handle project-specific configurations
if vim.fn.getcwd() ~= vim.env.HOME then
    local possible_vimrc = { '.vimrc', '.vim/.vimrc', '.vim/vimrc' }
    for _, vimrc in ipairs(possible_vimrc) do
        if vim.fn.filereadable(vim.fn.expand(vimrc)) == 1 then
            vim.cmd('source ' .. vimrc)
            break
        end
    end
end
