local ls = require 'luasnip'

local s = ls.snippet
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local fmt = require('luasnip.extras.fmt').fmt
local fmta = require('luasnip.extras.fmt').fmta
local rep = require('luasnip.extras').rep
local tex_utils = {}
tex_utils.in_mathzone = function()
  -- The `in_mathzone` function requires the VimTeX plugin
  return vim.fn['vimtex#syntax#in_mathzone']() == 1
end
tex_utils.in_text = function()
  return not tex_utils.in_mathzone()
end
tex_utils.in_comment = function() -- comment detection
  return vim.fn['vimtex#syntax#in_comment']() == 1
end
tex_utils.in_env = function(name) -- generic environment detection
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end
-- A few concrete environments---adapt as needed
tex_utils.in_equation = function() -- equation environment detection
  return tex_utils.in_env 'equation'
end
tex_utils.in_itemize = function() -- itemize environment detection
  return tex_utils.in_env 'itemize'
end
tex_utils.in_tikz = function() -- TikZ picture environment detection
  return tex_utils.in_env 'tikzpicture'
end
return {
  s({ trig = ';a', snippetType = 'autosnippet' }, {
    t '\\alpha',
  }),
  s({ trig = ';t', snippetType = 'autosnippet' }, {
    t '\\theta',
  }),
  s({ trig = ';b', snippetType = 'autosnippet' }, {
    t '\\beta',
  }),
  s({ trig = ';d', snippetType = 'autosnippet' }, {
    t '\\delta',
  }),
  s({ trig = ';e', snippetType = 'autosnippet' }, {
    t '\\epsilon',
  }),
  s({ trig = ';g', snippetType = 'autosnippet' }, {
    t '\\gamma',
  }),
  s({ trig = ';O', snippetType = 'autosnippet' }, {
    t '\\Omega',
  }),
  s({ trig = ';o', snippetType = 'autosnippet' }, {
    t '\\omega',
  }),
  s({ trig = ';l', snippetType = 'autosnippet' }, {
    t '\\lambda',
  }),
  s({ trig = ';s', snippetType = 'autosnippet' }, {
    t '\\sigma',
  }),

  s(
    { trig = 'Ff', snippetType = 'autosnippet', dscr = "Expands 'ff' into '\\frac{}{}'" },
    fmta('\\frac{<>}{<>}', {
      i(1),
      i(2),
    }),
    { condition = tex_utils.in_mathzone }
  ),
  s(
    { trig = 'Env', snippetType = 'autosnippet' },
    fmta(
      [[
      \begin{<>}
          <>
      \end{<>}
    ]],
      {
        i(1),
        i(2),
        rep(1), -- this node repeats insert node i(1)
      }
    )
  ),
  s(
    { trig = 'Dfn', snippetType = 'autosnippet' },
    fmta(
      [[
      \begin{dfn}{Name}
          <>
      \end{dfn}
    ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = 'Thm', snippetType = 'autosnippet' },
    fmta(
      [[
      \begin{thm}{Name}
          <>
      \end{thm}
    ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = 'Pf', snippetType = 'autosnippet' },
    fmta(
      [[
      \begin{proof}
          <>
      \end{proof}
    ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = 'Pict', snippetType = 'autosnippet' },
    fmta(
      [[
      \\vspace{1in}
      \begin{tikzpicture}
          <>
      \end{tikzpicture}
      \\vspace{1in}
    ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = 'Ctr', snippetType = 'autosnippet' },
    fmta(
      [[
      \begin{center}
          <>
      \end{center}
    ]],
      {
        i(1),
      }
    )
  ),
  s(
    { trig = 'rect', snippetType = 'autosnippet' },
    fmta('\\draw (<>,<>) rectangle (<>,<>);', {
      i(1),
      i(2),
      i(3),
      i(4),
    }),
    { condition = tex_utils.in_tikz() }
  ),
  s(
    { trig = 'circ', snippetType = 'autosnippet' },
    fmta('\\draw (<>,<>) circle (<>);', {
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex_utils.in_tikz() }
  ),
  s(
    { trig = 'Nd', snippetType = 'autosnippet' },
    fmta('\\draw node at (<>,<>) {<>};', {
      i(1),
      i(2),
      i(3),
    }),
    { condition = tex_utils.in_tikz() }
  ),
  s(
    { trig = ';cs' },
    fmta(
      [[
      \emph{Sources and collaborations.} 
      None. \\
      \emph{Proof.} \\
    ]],
      {}
    )
  ),
}
