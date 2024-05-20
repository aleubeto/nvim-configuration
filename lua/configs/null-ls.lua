local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
local null_ls = require("null-ls")
local format_on_save = true

-- Función para desactivar el formateo y guardar el archivo
local function save_without_format()
  format_on_save = false
  vim.cmd('write')
  format_on_save = true
end

vim.api.nvim_create_user_command(
  "SaveWithoutFormat",
  function ()
    save_without_format()
  end,
  { nargs = 0 }
)

local opts = {
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.formatting.black,
  },
  on_attach = function (client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr,
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function ()
          if format_on_save then
            vim.lsp.buf.format({ bufnr = bufnr })
          end
        end,
      })
    end
  end,
}

return opts
