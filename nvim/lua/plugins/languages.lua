local lsp_group = vim.api.nvim_create_augroup("lsp", { clear = true })

return {
  --####################################################################################
  --## Scala ##
  --####################################################################################

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "scalameta/nvim-metals",
      init = function()
        require("lazyvim.util").lsp.on_attach(function(_, buffer)
          -- Keymap setup
          vim.keymap.set(
            "n",
            "<leader>csw",
            require("metals").hover_worksheet,
            { buffer = buffer, desc = "Metals Worksheet" }
          )

          vim.keymap.set(
            "n",
            "<leader>csf",
            require("telescope").extensions.metals.commands,
            { buffer = buffer, desc = "Telescope Metals Commands" }
          )
        end)
      end,
    },
    opts = {
      servers = {
        metals = {},
      },
      setup = {
        metals = function(_, opts)
          local metals_config = require("metals").bare_config()

          metals_config.settings = {
            fallbackScalaVersion = "2.12.18",
            showImplicitArguments = true,
            showImplicitConversionsAndClasses = true,
            showInferredType = true,
            superMethodLensesEnabled = true,
            serverProperties = { "-Dmetals.loglevel=debug" },
            -- excludedPackages = { "akka.actor.typed.javadsl", "com.github.swagger.akka.javadsl" },
          }
          -- metals_config.init_options.statusBarProvider = "on"

          metals_config.on_attach = function(client, bufnr)
            client.server_capabilities.semanticTokensProvider = nil -- Disable hightlighting tokens from Metals
            require("plugins.lsp.keys").setup(client, bufnr)
            vim.api.nvim_create_autocmd("CursorHold", {
              callback = vim.lsp.buf.document_highlight,
              buffer = bufnr,
              group = lsp_group,
            })
            vim.api.nvim_create_autocmd("CursorMoved", {
              callback = vim.lsp.buf.clear_references,
              buffer = bufnr,
              group = lsp_group,
            })
            vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "InsertLeave" }, {
              callback = vim.lsp.codelens.refresh,
              buffer = bufnr,
              group = lsp_group,
            })
          end

          metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
          local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })

          vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt", "java" },
            callback = function()
              require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
          })

          return true -- Return true to disable lspconfig setup for this server.
        end,
      },
    },
  },

  --####################################################################################
  --## Lobster ##
  --####################################################################################
  -- Lobster LSP
  -- { "jcorbin/vim-lobster" },
}
