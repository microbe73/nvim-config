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
return {
  s({ trig = 'rfl', snippetType = 'autosnippet' }, {
    t 'reflexivity.',
  }),
  s({ trig = 'Smp', snippetType = 'autosnippet' }, {
    t 'simpl.',
  }),
  s(
    { trig = 'Rwr', snippetType = 'autosnippet' },
    fmta(
      [[
      rewrite <>.
    ]],
      {
        i(1),
      }
    )
  ),
  s({ trig = 'Dst', snippetType = 'autosnippet' }, fmta([[ destruct <> .]], { i(1) })),
  s({ trig = 'Inn', snippetType = 'autosnippet' }, fmta([[ induction <> .]], { i(1) })),
  s({ trig = 'Thm', snippetType = 'autosnippet' }, { t 'Theorem : ' }),
  s({ trig = 'Lma', snippetType = 'autosnippet' }, { t 'Lemma : ' }),
  s({ trig = ';fa', snippetType = 'autosnippet' }, { t 'forall' }),
  s({ trig = 'Exm', snippetType = 'autosnippet' }, { t 'Example : ' }),
  s({ trig = 'Pf', snippetType = 'autosnippet' }, { t 'Proof.' }),
  s(
    { trig = 'Fxp', snippetType = 'autosnippet' },
    fmta(
      [[
Fixpoint <> (<>) : <> :=
  <>
.]],
      {
        i(1),
        i(2),
        i(3),
        i(4),
      }
    )
  ),
  s(
    { trig = 'Mtw', snippetType = 'autosnippet' },
    fmta(
      [[
match <> with
| <>
end]],
      {
        i(1),
        i(2),
      }
    )
  ),
  s(
    { trig = 'Inuc', snippetType = 'autosnippet' },
    fmta(
      [[ 
Inductive <> : <> :=
  <> 
.]],
      {
        i(1),
        i(2),
        i(3),
      }
    )
  ),
}
