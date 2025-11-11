local ls = require("luasnip")
-- some shorthands...
local s = ls.snippet
local n = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmta = require("luasnip.extras.fmt").fmta

-- Math context detection
local tex = {}
tex.in_mathzone = function()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end
tex.in_text = function()
  return not tex.in_mathzone()
end

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "sn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\sin(<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "ssn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\sin[<>](<>)", {
        i(1),
        i(2),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "cn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\cos(<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "cnn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\cos[<>](<>)", {
        i(1),
        i(2),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "tn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\tan(<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "ttn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\tan(<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "shn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\sinh(<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "shhn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\sinh[<>](<>)", {
        i(1),
        i(2),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "chn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\cosh(<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "chhn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\cosh[](<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "thn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\tanh(<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})

ls.add_snippets(nil, {
  tex = {
    -- Standard \sin(x) when typing "sn"
    s(
      { trig = "thhn", snippetType = "autosnippet", priority = 2000 },
      fmta("\\tanh[](<>)", {
        i(1),
      }),
      { condition = tex.in_mathzone }
    ),
  },
})
