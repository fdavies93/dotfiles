function MagmaInitPython()
    vim.cmd[[
    :MagmaInit python3
    :MagmaEvaluateArgument a=5
    ]]
end

vim.cmd[[
:command MagmaInitPython lua MagmaInitPython()
]]
