return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
  	"williamboman/mason.nvim",
  	opts = {
  		ensure_installed = {
  			"lua-language-server", "stylua",
  			"html-lsp", "css-lsp" , "prettier",
        "eslint-lsp",
        -- Node and next.js
        "typescript-language-server",
        "tailwindcss-language-server",
        -- Python
        "pyright", "black",
  		},
  	},
  },
  {
  	"nvim-treesitter/nvim-treesitter",
  	opts = {
  		ensure_installed = {
  			"vim", "lua", "vimdoc",
        "html", "css",
        "javascript", "typescript", "tsx",
        "python", "rust", "go", "java",
  		},
  	},
  },
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function ()
      return require("configs.null-ls")
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "html",
    },
    config = function ()
      require("nvim-ts-autotag").setup()
    end
  },
  -- love2d lua plugin
  {
    "S1M0N38/love2d.nvim",
    cmd = "LoveRun",
    opts = { },
    keys = {
      { "<leader>v", ft = "lua", desc = "LÖVE" },
      { "<leader>ll", "<cmd>LoveRun<cr>", ft = "lua", desc = "Run LÖVE" },
      { "<leader>lk", "<cmd>LoveStop<cr>", ft = "lua", desc = "Stop LÖVE" },
    },
  }
}
