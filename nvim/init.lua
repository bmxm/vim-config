local options = require "options"
local plugins = require "plugins"

-- 在 vim 下执行可以看到 vim 数据目录路径
-- :echo stdpath('data')
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

-- 将 lazypath 的值添加到现有的运行时路径列表的前面
vim.opt.rtp:prepend(lazypath)

-- 加载 lazy 模块
require("lazy").setup(plugins, {})
