
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

function hashBit(size)
     local vars = {"A","B","C","D","E","F","0","1","2","3","4","5","6","7","8","9"}
     local returnBit = ''
     for i=1, size do
          returnBit = returnBit .. vars[math.floor(MathUtils:GetRandomInt(1,16))]..vars[math.floor(MathUtils:GetRandomInt(1,16))]
     end
     return returnBit
end

function GenerateCustomGuid(customPrefix)
     return Guid(customPrefix.."-"..hashBit(2).."-"..hashBit(2).."-"..hashBit(2).."-"..hashBit(6), "D")
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

-- enable debug messages in console
function dprint(message)
     if (true) then -- true = on, false = off
          print(message)
     end
end

function table:has(value)
     for i=1, #self do
          if (self[i] == value) then
               return true
          end
     end
     return false
end

function string:split(value, seperator)
     if (seperator == nil) then
          seperator = "%s"
     end
     local result = {}
     for piece in string.gmatch(value, "([^"..seperator.."]+)") do
          result[#result+1] = piece
     end
     return result
end

function string:isLower(value)
     return str:lower() == str
end

function string:isDigit(value)
     return tonumber(str) ~= nil
end

ebxEditUtils = require('__shared/EbxEditUtils')