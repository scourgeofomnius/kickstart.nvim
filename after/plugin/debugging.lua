local dap_ok, dap = pcall(require, "dap")
if not (dap_ok) then
    print("nvim dap not installed")
    return
end
local mason_registry = require("mason-registry")

local codelldb = mason_registry.get_package("codelldb")
local extension_path = codelldb.get_install_path(codelldb)
local codelldb_path = extension_path .. "\\extension\\adapter\\codelldb"
print(codelldb_path)

require('dap').set_log_level("DEBUG")
dap.adapters.codelldb = {
      type = "server",
      port = "${port}",
      executable = {
          command = codelldb_path, -- I installed codelldb through mason.nvim
          args = {"--port", "${port}"},
          detatched = false,
      },
}

dap.configurations.cpp = {
      {
           name = "Launch",
           type = "codelldb",
           request = "launch",
           program = function()
                  return vim.fn.input("Path to executable: ",  vim.fn.getcwd()..'/', "file")
           end,
           cwd = '${workspaceFolder}',
           stopOnEntry = false,
      },
}



vim.keymap.set("n", "<Leader>dt", ':DapToggleBreakpoint<CR>')
vim.keymap.set("n", "<Leader>dx", ':DapTerminate<CR>')
vim.keymap.set("n", "<Leader>do", ':DapStepOver<CR>')
