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
        basedpyright = {
          settings = {
            basedpyright = {
              typeCheckingMode = "off", -- Faster than "strict", sufficient for Django.
              useLibraryCodeForTypes = true,
              diagnosticMode = "openFilesOnly", -- Only check open files for speed.
              reportMissingImports = true,
              reportMissingTypeStubs = false, -- Avoid stub warnings (django-stubs handles this).
              reportOptionalMemberAccess = false, -- Django-friendly.
              reportOptionalSubscript = false,
              reportOptionalCall = false,
              reportPrivateImportUsage = false,
              autoSearchPaths = true,
              venvPath = "./", -- Path to virtualenv directory.
              venv = "env", -- Virtualenv name.
            },
          },
        },
        pylsp = { enabled = false }, -- Ensure pylsp is disabled.
        jedi_language_server = { enabled = false }, -- Ensure jedi is disabled.
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters_by_ft = {
        python = { "ruff" }, -- Use Ruff for fast linting.
      },
      linters = {
        ruff = {
          cmd = "ruff", -- Uses venv’s Ruff.
          args = { "--fix", "--exit-zero", "--extend-select=D", "--ignore=D100,D104" }, -- Django rules, ignore some docstrings.
        },
      },
      events = { "BufWritePost", "InsertLeave" }, -- Lint on save or after typing.
    },
  },
}
