local M = {}

local whichkey = require "which-key"

-- local function keymap(lhs, rhs, desc)
--   vim.keymap.set("n", lhs, rhs, { silent = true, desc = desc })
-- end

function M.setup()
  local function cmd(lhs, rhs, desc)
    return { "<leader>d" .. lhs, "<cmd>lua " .. rhs .. "<cr>", desc = desc }
  end

  whichkey.add({
    mode = "n",
    silent = true,
    { "<leader>d", group = "Debug" },
    cmd("R", "require'dap'.run_to_cursor()", "Run to Cursor"),
    cmd("E", "require'dapui'.eval(vim.fn.input '[Expression] > ')", "Evaluate Input"),
    cmd("C", "require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')", "Conditional Breakpoint"),
    cmd("U", "require'dapui'.toggle()", "Toggle UI"),
    cmd("b", "require'dap'.step_back()", "Step Back"),
    cmd("c", "require'dap'.continue()", "Continue"),
    cmd("d", "require'dap'.disconnect()", "Disconnect"),
    cmd("e", "require'dapui'.eval()", "Evaluate"),
    cmd("g", "require'dap'.session()", "Get Session"),
    cmd("h", "require'dap.ui.widgets'.hover()", "Hover Variables"),
    cmd("n", "require'dap-python'.debug_selection()", "Debug selection"),
    cmd("m", "require'dap-python'.test_method()", "Test method"),
    cmd("M", "require'dap-python'.test_class()", "Test class"),
    cmd("S", "require'dap.ui.widgets'.scopes()", "Scopes"),
    cmd("i", "require'dap'.step_into()", "Step Into"),
    cmd("o", "require'dap'.step_over()", "Step Over"),
    cmd("p", "require'dap'.pause.toggle()", "Pause"),
    cmd("q", "require'dap'.close()", "Quit"),
    cmd("r", "require'dap'.repl.toggle()", "Toggle Repl"),
    cmd("s", "require'dap'.continue()", "Start"),
    cmd("t", "require'dap'.toggle_breakpoint()", "Toggle Breakpoint"),
    cmd("x", "require'dap'.terminate()", "Terminate"),
    cmd("u", "require'dap'.step_out()", "Step Out"),
  })

  whichkey.add({
    mode = "v",
    silent = true,
    { "<leader>e", "<cmd>lua require'dapui'.eval()<cr>", desc = "Evaluate" },
  })
end

return M
