
local lsp = require "lspconfig"
local coq = require "coq"

require('coq_3p') {
    {
        src = "nvimlua", short_name = "nLUA", conf_only = true
    },
    -- { src = "orgmode", short_name = "ORG" },
    -- { src = "dap" },
}
