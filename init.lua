-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
vim.wo.relativenumber = true
vim.g.lazyvim_python_lsp = "basedpyright"

require("lspconfig").basedpyright.setup({
  settings = {
    basedpyright = {
      typeCheckingMode = "off",
      useLibraryCodeForTypes = true,
      diagnosticMode = "workspace", -- "openFilesOnly" or "workspace"
      reportMissingImports = true, -- Set to false to disable missing import warnings
      reportMissingTypeStubs = false, -- Disable missing type stub warnings
      reportOptionalMemberAccess = false, -- Disable optional member access warnings
      reportOptionalSubscript = false, -- Disable optional subscript warnings
      reportOptionalCall = false, -- Disable optional call warnings
      reportPrivateImportUsage = false, -- Disable warnings about private imports
      autoSearchPaths = true,

      venvPath = ".",
      venv = "env",
    },
  },
})

require("lspconfig").pylsp.setup({
  settings = {
    pylsp = {
      plugins = {
        jedi_completion = { enabled = true },
        jedi_hover = { enabled = false },
        jedi_signature_help = { enabled = false },
        pyflakes = { enabled = true },
        pycodestyle = { enabled = false },
        mccabe = { enabled = true },
        pylint = { enabled = false },
        flake8 = { enabled = true },
        autopep8 = { enabled = false },
        yapf = { enabled = false },
        black = { enabled = false },
        -- autopape8 = { enabled = false },
        -- rope_autoimport = { enabled = false }, -- if installed
        -- You can add more plugins here if you use others
      },
    },
  },
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingprovider = false
  end,
})
