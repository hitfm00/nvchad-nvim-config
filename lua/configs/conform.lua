local conform = require "conform"

local options = {
  debug = true,
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    typescript = { "prettier", "eslint_d" },
    javascript = { "prettier", "eslint_d" },
    javascriptreact = { "prettier", "eslint_d" },
    typescriptreact = { "prettier", "eslint_d" },
  },

  format_after_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
    async = true,
  },
}

conform.setup(options)
