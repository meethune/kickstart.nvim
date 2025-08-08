local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local t = ls.text_node

return {
  -- Python file template
  s("_template_", {
    t({
      "#!/usr/bin/env python",
      "# $Id$",
      "# -*- coding: utf-8 -*-",
      "",
    }),
    i(0),
    t({
      "",
      "# vim:syntax=python",
      "# vim:sw=4:softtabstop=4:expandtab",
    }),
  }),
}