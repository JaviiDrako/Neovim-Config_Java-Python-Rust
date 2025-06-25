
-- My lsp config with capabilities and on_attach
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local java = require("java")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Mason Setup
mason.setup()

mason_lspconfig.setup({
  ensure_installed = {
    "jdtls",          -- Java (nvim-java does the hard work)
    "lua_ls",         -- Lua
    "rust_analyzer",  -- Rust
    "pyright",        -- Python
  },
})

-- Set nvim-java config
java.setup()

-- Set lspconfig
lspconfig.jdtls.setup({})

-- Capabilities and on_attach
local capabilities = cmp_nvim_lsp.default_capabilities()
local on_attach = function(client, bufnr)
  local bufmap = function(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
  end

  bufmap("n", "gd", vim.lsp.buf.definition, "[LSP] Go to definition")
  bufmap("n", "gr", vim.lsp.buf.references, "[LSP] Show references")
  bufmap("n", "gi", vim.lsp.buf.implementation, "[LSP] Go to implementation")
  bufmap("n", "K", vim.lsp.buf.hover, "[LSP] Hover documentation")
  bufmap("n", "<leader>rn", vim.lsp.buf.rename, "[LSP] Rename symbol")
  bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "[LSP] Code action")
  bufmap("n", "<leader>f", function() vim.lsp.buf.format { async = true } end, "[LSP] Format buffer")
end

-- Configure LSP servers except jdtls
local servers = {
  "lua_ls",
  "rust_analyzer",
  "pyright",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    on_attach = on_attach,
  })
end


-- Print keymaps with :LspKeymaps command
vim.api.nvim_create_user_command("LspKeymaps", function()
  local lines = {
    "🔧 LSP Keymaps activos:",
    "  gd       → Go to definition",
    "  gr       → Show references",
    "  gi       → Go to implementation",
    "  K        → Hover documentation",
    "  <leader>rn → Rename symbol",
    "  <leader>ca → Code action",
    "  <leader>f  → Format buffer",
  }
  vim.notify(table.concat(lines, "\n"), vim.log.levels.INFO, { title = "LSP Keymaps" })
end, {})
