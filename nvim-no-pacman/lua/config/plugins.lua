local M = {}

M.get_stem = function(full_path)
   local parts = {}
   for v in string.gmatch(full_path,"[^/]+")
   do
      table.insert(parts, v)
   end
   return parts[#parts]
end

M.setup = function(base_path)
end

return M
