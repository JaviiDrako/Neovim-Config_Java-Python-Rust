-- Mason manages installation and configuration of LSP servers and related tools in Neovim, 
-- automating setup for languages like Lua, Python, Rust, and Java.

return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		require("mason").setup()
		require("mason-lspconfig").setup()
		require("mason-tool-installer").setup({
			ensure_installed = {
				"lua-language-server",
				"rust-analyzer",
				"jdtls",
			},
		})
	end,
}
