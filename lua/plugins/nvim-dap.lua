---@param config {type?:string, args?:string[]|fun():string[]?}
local function get_args(config)
  local args = type(config.args) == "function" and (config.args() or {}) or config.args or {} --[[@as string[] | string ]]
  local args_str = type(args) == "table" and table.concat(args, " ") or args --[[@as string]]

  config = vim.deepcopy(config)
  ---@cast args string[]
  config.args = function()
    local new_args = vim.fn.expand(vim.fn.input("Run with args: ", args_str)) --[[@as string]]
    if config.type and config.type == "java" then
      ---@diagnostic disable-next-line: return-type-mismatch
      return new_args
    end
    return require("dap.utils").splitstr(new_args)
  end
  return config
end

return {
  "mfussenegger/nvim-dap",

  -- stylua: ignore
  keys = {
    { "<leader>dt", function() require("dap").down() end, desc = "Down" },
    { "<leader>dn", function() require("dap").up() end, desc = "Up" },
    { "<leader>dj", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dk", function() end, desc = "" },
    { "<F4>", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<F5>", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<F6>", function() require("dap").step_into() end, desc = "Step Into" },
    { "<F7>", function() require("dap").step_over() end, desc = "Step Over" },
    { "<F8>", function() require("dap").step_out() end, desc = "Step Out" },
    { "<F9>", function() require("dap").step_back() end, desc = "Step Back" },
    { "<F10>", function() require("dap").restart_frame() end, desc = "Restart Frame" },
    { "<F11>", function() require("dap").pause() end, desc = "Pause" },
    { "<F12>", function() require("dap").terminate() end, desc = "Terminate" },
  },
};
