MyModVersion = '1.0.0'

function tabledump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. tabledump(v) .. ','
      end
      return s .. '} '
   else
      return type(o) .. ': ' .. tostring(o)
   end
end
