return {
  {
    "mfussenegger/nvim-lint",
    cond = not vim.g.vscode,
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local lint = require "lint"

      lint.linters_by_ft = {
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        svelte = { "eslint_d" },
        python = { "pylint" },
      }

      local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

      vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
        group = lint_augroup,
        callback = function()
          lint.try_lint(nil, { ignore_errors = true })
        end,
      })

      vim.keymap.set("n", "<leader>cl", function()
        lint.try_lint()
      end, { desc = "Trigger linting for current file" })
    end,
  },

  {
    "pmizio/typescript-tools.nvim",
    event = "BufReadPre",
    cond = not vim.g.vscode,
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {
      settings = {
        expose_as_code_action = {
          "fix_all",
          "add_missing_imports",
          "remove_unused",
          "remove_unused_imports",
        },
      },
    },
  },
  {
    "hadronized/hop.nvim",
    event = "BufReadPre",
    config = function()
      require("hop").setup {
        keys = "etovxqpdygfblzhckisuran",
      }
    end,
  },
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
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
        "eslint-lsp",
        "prettierd",
        "tailwindcss-language-server",
        "typescript-language-server",
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },

  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "vimdoc",
        "html",
        "css",
        "lua",
        "javascript",
        "typescript",
        "tsx",
      },
    },
  },
  {
    "github/copilot.vim",
    event = "BufEnter",
  },
  {
    "kdheepak/lazygit.nvim",
    event = "BufEnter",
    -- optional for floating window border decoration
    requires = {
      "nvim-lua/plenary.nvim",
    },
  },
  {
    "shortcuts/no-neck-pain.nvim",
    event = "BufEnter",
    width = 80,
    version = "*",
  },
  {
    "xiyaowong/transparent.nvim",
    event = "BufEnter",

    groups = {
      "Normal",
      "NormalNC",
      "Comment",
      "Constant",
      "Special",
      "Identifier",
      "Statement",
      "PreProc",
      "Type",
      "Underlined",
      "Todo",
      "String",
      "Function",
      "Conditional",
      "Repeat",
      "Operator",
      "Structure",
      "LineNr",
      "NonText",
      "SignColumn",
      "CursorLine",
      "CursorLineNr",
      "StatusLine",
      "StatusLineNC",
      "EndOfBuffer",
    },
    -- table: additional groups that should be cleared
    extra_groups = {},
    -- table: groups you don't want to clear
    exclude_groups = {},
    -- function: code to be executed after highlight groups are cleared
    -- Also the user event "TransparentClear" will be triggered
    on_clear = function() end,
  },
}
