return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        volar = {
          init_options = {
            vue = {
              hybridMode = false,
            },
          },
          settings = {
            typescript = {
              inlayHints = {
                enumMemberValues = { enabled = true },
                functionLikeReturnTypes = { enabled = true },
                propertyDeclarationTypes = { enabled = true },
                parameterTypes = {
                  enabled = true,
                  suppressWhenArgumentMatchesName = true,
                },
                variableTypes = { enabled = true },
              },
            },
          },
        },
        tsserver = {
          init_options = {
            plugins = {
              {
                name = "@vue/typescript-plugin",
                location = vim.fn.stdpath("data")
                  .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
                languages = { "vue" },
              },
            },
          },
          settings = {
            typescript = {
              tsserver = {
                useSyntaxServer = false,
              },
              inlayHints = {
                includeInlayParameterNameHints = "all",
                includeInlayParameterNameHintsWhenArgumentMatchesName = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = true,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        -- angularls = {
        --   cmd = { "node", "/usr/lib/node_modules/@angular/language-server/index.js", "--stdio" },
        --   on_new_config = function(new_config, _)
        --     new_config.cmd = {
        --       "node",
        --       "/path/to/global/node_modules/@angular/language-server/index.js",
        --       "--stdio",
        --       "--tsProbeLocations",
        --       "",
        --       "--ngProbeLocations",
        --       "",
        --     }
        --   end,
        --   filetypes = { "typescript", "html", "typescriptreact", "typescript.tsx" },
        --   root_dir = require("lspconfig.util").root_pattern("angular.json", "project.json"),
        -- },
      },
    },

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

          venvPath = "./",
          venv = "env",
        },
      },
    }),

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
    }),
  },
}
