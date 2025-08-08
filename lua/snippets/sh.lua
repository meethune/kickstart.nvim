local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Shell script template
  s("_template_", {
    t({
      "#!/usr/bin/env bash",
      "# $Id$",
      "",
    }),
    i(0),
    t({
      "",
      "# vim:syntax=sh",
      "# vim:sw=4:softtabstop=4:expandtab",
    }),
  }),
}