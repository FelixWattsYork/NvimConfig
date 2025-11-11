-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.autocmds")
-- Snippets Configuration
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/LuaSnip" } })
require("luasnip.loaders.from_lua").load({ paths = { "~/.config/nvim/LuaSnip/tex" } })
-- Require LuaSnip
local luasnip = require("luasnip")

vim.opt.number = true -- Show line numbers (optional)
vim.opt.textwidth = 0 -- Disable automatic line breaking
vim.opt.wrap = true -- Enable line wrapping
vim.opt.wrapmargin = 0 -- No extra margin for wrapping
vim.opt.linebreak = true -- Break lines at word boundaries (optional)

vim.g.minipairs_disable = true
vim.keymap.set("n", "<localLeader>w", "<Cmd>write<CR>")

vim.api.nvim_set_keymap("i", "jk", "<Esc>", { noremap = true, silent = true })

vim.g.vimtex_compiler_latexmk = {
  build_dir = "",
  options = {
    "-xelatex", -- or '-lualatex'
    "-file-line-error",
    "-interaction=nonstopmode",
    "-synctex=1",
  },
}

-- Configure key mappings
vim.keymap.set({ "i", "s" }, "<Tab>", function()
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    return "<Tab>"
  end
end, { silent = true, expr = true })

vim.keymap.set({ "i", "s" }, "<S-Tab>", function()
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    return "<S-Tab>"
  end
end, { silent = true, expr = true })

vim.g.tex_conceal = "abdgm"

-- Enable spell check for specific file types
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "lua", "markdown", "tex", "text" }, -- List the file types here
  callback = function()
    vim.opt.spell = true
  end,
})

vim.opt.spelllang = "en_uk"

-- Use <localleader>c to trigger continuous compilation
vim.keymap.set("n", "<localleader>c", "<Plug>(vimtex-compile)")
-- In terminal mode, pressing jk goes back to normal mode
vim.keymap.set("t", "jk", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.cmd([[
nmap <silent> cp :set opfunc=ChangePaste<CR>g@

function! ChangePaste(type, ...) abort
    silent exe "normal! `[v`]\"_c"
    silent exe "normal! p"
endfunction
]])
