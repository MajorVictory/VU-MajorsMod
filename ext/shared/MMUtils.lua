
function split(pString, pPattern)
   local Table = {}  -- NOTE: use {n = 0} in Lua-5.0
   local fpat = "(.-)" .. pPattern
   local last_end = 1
   local s, e, cap = pString:find(fpat, 1)
   while s do
      if s ~= 1 or cap ~= "" then
     table.insert(Table,cap)
      end
      last_end = e+1
      s, e, cap = pString:find(fpat, last_end)
   end
   if last_end <= #pString then
      cap = pString:sub(last_end)
      table.insert(Table, cap)
   end
   return Table
end

function dump(o)
    if(o == nil) then
        print("nil")
    end
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end


function IsPrimaryLevel( p_Bundle )
    local s_Path = split(p_Bundle, "/")
    if s_Path[2] == s_Path[3] then
        return true
    end
    return false
end

function getModuleState()

  if (SharedUtils:IsClientModule() and SharedUtils:IsServerModule()) then
    return 'Shared'
  elseif (SharedUtils:IsClientModule() and not SharedUtils:IsServerModule()) then
    return 'Client'
  elseif (not SharedUtils:IsClientModule() and SharedUtils:IsServerModule()) then
    return 'Server'
  end
  return 'Unkown'
end