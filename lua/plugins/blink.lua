return {
  {
    "saghen/blink.cmp",
    dependencies = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets" },
    version = "1.*",
    opts = {
      -- Key mappings
      keymap = {
        preset = "none", -- we’ll define custom mappings
        ["<CR>"] = { "accept", "fallback" },
        ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },
        ["<C-Space>"] = { "show", "fallback" }, -- manual trigger
        ["<C-e>"] = { "hide", "fallback" }, -- close popup
      },

      -- Snippet source
      snippets = { preset = "luasnip" },

      -- Appearance (optional)
      appearance = {
        nerd_font_variant = "mono",
      },

      -- Completion settings
      completion = {
        documentation = { auto_show = false }, -- don't show docs automatically
        trigger = { show_on_insert = false }, -- manual popup only
      },

      -- Sources
      sources = {
        default = { "lsp", "snippets", "buffer", "path" },
      },

      -- Fuzzy matching
      fuzzy = { implementation = "prefer_rust_with_warning" },
    },
    opts_extend = { "sources.default" },
  },
}
