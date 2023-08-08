return {
	-- 该脚本用来配置 Neovim 插件
	--  config 字段用来指定一个函数，该函数将在插件加载后执行
	--  require "plugin-configs.lsp" 语句会去 plugin-configs 目录下查找名为 xxx.lua 的文件，并执行其中的代码	

	-- Editor support.
	-- The next few plugins are really the IDE feel.
	"wbthomason/packer.nvim",
	{
		"williamboman/mason.nvim",
		build = ":MasonUpdate", -- :MasonUpdate updates registry contents
	},

	-- 配置 LSP 服务器
	"williamboman/mason-lspconfig.nvim",
	{
		"neovim/nvim-lspconfig",
		config = function()
			require "plugin-configs.lsp"
		end,
	},

	-- 显示函数签名
	"ray-x/lsp_signature.nvim",

	-- 在 LSP 完成菜单中显示类型图标
	"onsails/lspkind.nvim",

	-- dependencies 中定义的插件不需要单独安装，packer.nvim 会处理这些依赖关系
	-- "kyazdani42/nvim-web-devicons",

	-- 语法高亮和代码分析插件
	{
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
		config = function()
			require("nvim-treesitter.configs").setup {
				highlight = {
					enable = true,
					auto_install = true,
				},
			}
		end,
	},

	-- 用于重构代码的插件
	{
		"ThePrimeagen/refactoring.nvim",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require "plugin-configs.refactoring"
		end,
	},

	-- 支持 EditorConfig 配置文件的插件
	"editorconfig/editorconfig-vim",
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "1.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	-- 给括号添加彩虹颜色的插件
	"luochen1990/rainbow",

	-- 一个用于自动补全的插件
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require "plugin-configs.cmp"
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"hrsh7th/cmp-nvim-lsp",
			"onsails/lspkind-nvim",
			"L3MON4D3/LuaSnip",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lsp-document-symbol",
		},
	},
	"lbrayner/vim-rzip",
	{
		"b0o/mapx.nvim",
		config = function()
			require "keyboard-mappings"
		end,
	},
	{
		"folke/trouble.nvim",
		config = function()
			require "plugin-configs.trouble"
		end,
	},
	"f-person/git-blame.nvim",
	"lewis6991/gitsigns.nvim",
	{
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup {}
		end,
	},
	{
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	},
	{
		"kosayoda/nvim-lightbulb",
		dependencies = "antoinemadec/FixCursorHold.nvim",
		config = function()
			require("nvim-lightbulb").setup { autocmd = { enabled = true } }
		end,
	},
	-- Window management
	{
		"aserowy/tmux.nvim",
		config = function()
			require "plugin-configs.tmux"
		end,
	},
	--	{
	--		"akinsho/bufferline.nvim",
	--		dependencies = "kyazdani42/nvim-web-devicons",
	--		config = function() require "plugin-configs.bufferline" end,
	--	},

	-- File management.
	{
		"kyazdani42/nvim-tree.lua",
--		dependencies = {
--			"kyazdani42/nvim-web-devicons",
--		},
		config = function()
			require "plugin-configs.nvim-tree"
		end,
	},

	-- Code helpers.
	{
		"github/copilot.vim",
		config = function()
			vim.g.copilot_filetypes = {
				["*"] = false,
				["bash"] = true,
				["go"] = true,
				["typescript"] = true,
				["javascript"] = true,
				["typescriptreact"] = true,
				["javascriptreact"] = true,
				["rust"] = true,
				["python"] = true,
				["lua"] = true,
				["c"] = true,
				["cpp"] = true,
				["swift"] = true,
				["vim"] = true,
			}
		end,
	},
	"sebdah/vim-delve",
	{
		"windwp/nvim-autopairs",
		config = function()
			require "plugin-configs.autopairs"
		end,
	},
	"tpope/vim-endwise",
	"tpope/vim-fugitive",
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup()
		end,
	},
	"tpope/vim-surround",
	"vim-test/vim-test",

	-- Visual.
	{
		"yamatsum/nvim-nonicons",
		dependencies = { "kyazdani42/nvim-web-devicons" },
	},
	"ap/vim-css-color",
	{
		"glepnir/galaxyline.nvim",
		branch = "main",
		config = function()
			require "plugin-configs.galaxyline"
		end,
	},

	-- Telescope 是一个高度可定制的模糊查找器，可以用来搜索任何东西，包括文件内容。
	-- 最简单的形式，你可以使用 :Telescope live_grep 命令在你的项目中搜索文本。
	-- 此工具依赖于 rg, 你可以使用 brew install ripgrep 安装它。
	-- 使用 rg --version 来检查是否安装成功。
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope-packer.nvim",
			"nvim-telescope/telescope-dap.nvim",
		},
		config = function()
			require "plugin-configs.telescope"
		end,
	},
	{
		"goolord/alpha-nvim",
		alpha = false,
		config = function()
			require("plugin-configs.dashboard").setup()
		end,
	},
	{
		"rcarriga/nvim-notify",
		config = function()
			local notify = require "notify"

			notify.setup {
				background_colour = "#000000",
			}

			vim.notify = notify
		end,
	},
	{
		"catppuccin/vim",
		config = function()
			vim.cmd [[
				colorscheme catppuccin_mocha
				hi Normal guibg=NONE ctermbg=NONE
			]]
		end,
	},
	--	{
	--		"marko-cerovac/material.nvim",
	--		config = [[ require "plugin-configs.theme" ]],
	--	},

	-- Debugging
	{
		"rcarriga/nvim-dap-ui",
		"leoluz/nvim-dap-go",
		config = function()
			require "plugin-configs.nvim-dap-gui"
		end,
	},
	"mfussenegger/nvim-dap",
	{
		"jay-babu/mason-nvim-dap.nvim",
		config = function()
			require "plugin-configs.mason"
		end,
	},
	"theHamsta/nvim-dap-virtual-text",
	"jbyuki/one-small-step-for-vimkind",
}
