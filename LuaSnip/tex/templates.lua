local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s({ trig = "preamble1", snippetType = "autosnippet" }, {
    -- This function node runs first. It deletes the 2 characters before the cursor.
    f(function()
      -- This simulates pressing Backspace twice to delete the "H1"
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("", true, false, true), "n", false)
      return "" -- The function itself outputs no text
    end),
    -- The rest of your snippet follows
    t({
      "\\documentclass[12pt, a4paper]{article}",
      "",
      "% ------------------------------------------------------------",
      "% BASIC FORMATTING",
      "% ------------------------------------------------------------",
      "\\usepackage[a4paper, margin=2.5cm]{geometry}",
      "\\usepackage{times}",
      "\\renewcommand{\\baselinestretch}{1.15}",
      "",
      "% ------------------------------------------------------------",
      "% GRAPHICS AND FIGURES",
      "% ------------------------------------------------------------",
      "\\usepackage{graphicx}",
      "\\graphicspath{{./images/}}",
      "\\usepackage{wrapfig}",
      "\\usepackage{subcaption}",
      "\\usepackage{svg}",
      "",
      "% ------------------------------------------------------------",
      "% MATHEMATICS",
      "% ------------------------------------------------------------",
      "\\usepackage{amsmath, amsfonts}",
      "\\usepackage{physics}",
      "% ------------------------------------------------------------",
      "% TIKZ & PGFPLOTS",
      "% ------------------------------------------------------------",
      "\\usepackage{tikz}",
      "\\usetikzlibrary{}",
      "\\usepackage{pgfplots}",
      "\\pgfplotsset{compat=1.14}",
      "\\usepgfplotslibrary{patchplots}",
      "% ------------------------------------------------------------",
      "% LINKS & REFERENCES",
      "% ------------------------------------------------------------",
      "\\usepackage[colorlinks]{hyperref}",
      "\\usepackage[nameinlink]{cleveref}",
      "% ------------------------------------------------------------",
      "% DOCUMENT METADATA",
      "% ------------------------------------------------------------",
      "\\title{",
    }),
    i(1), -- insert node for title
    t({
      "}",
      "\\author{Felix}",
      "\\date{today}",
      "",
      "% ------------------------------------------------------------",
      "% DOCUMENT BODY",
      "% ------------------------------------------------------------",
      "\\begin{document}",
      "\\maketitle",
    }),
    i(0), -- final cursor for main content
    t({
      "",
      "\\end{document}",
    }),
  }),
}
