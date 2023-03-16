local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.deno_fmt,
  b.formatting.prettier.with { filetypes = { "html", "markdown", "css", "yaml", "json" } },

  -- Lua
  b.formatting.stylua,

  -- Shell
  b.formatting.shfmt,
  b.diagnostics.shellcheck.with { diagnostics_format = "#{m} [#{c}]" },

  -- cpp
  b.formatting.clang_format,
  b.formatting.clang_format.with { filetypes = { "c", "cpp", "proto" } },
  -- go
  b.formatting.gofumpt,
  b.formatting.goimports,
  -- b.formatting.golines,
}

null_ls.setup {
  debug = true,
  sources = sources,
  on_attach = function(client)
    if client.server_capabilities.documentFormattingProvider then
      vim.cmd [[
                augroup LspFormatting
                autocmd! * <buffer>
                autocmd BufWritePre <buffer> lua vim.lsp.buf.format()
                augroup END
                ]]
    end
  end,
}
