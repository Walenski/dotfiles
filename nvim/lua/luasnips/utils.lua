local M = {}

-- Returns true if the cursor is inside a math environment (for LaTeX)
function M.in_math_mode()
  local ts_utils = require("nvim-treesitter.ts_utils")
  local node = ts_utils.get_node_at_cursor()
  while node do
    local node_type = node:type()
    if node_type == "math_environment"
      or node_type == "inline_formula"
      or node_type == "displayed_equation"
    then
      return true
    end
    node = node:parent()
  end
  return false
end

return M

