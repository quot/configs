return {
  --####################################################################################
  --## UI/UX plugins meant specifically for the editor buffer.
  --####################################################################################

  -- Configs for treesitter
  {
    "nvim-telescope/telescope.nvim",
    opts = {
      auto_install = true,
      defaults = {
        path_display = { "smart" },
      },
    },
  },

  { "nvim-treesitter/nvim-treesitter-context" },
}
