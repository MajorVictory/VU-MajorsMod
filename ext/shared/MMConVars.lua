class "MMConVars"

function MMConVars:__init()
	self.cvars = {
		["FamasRoF"] = {
			["Help"] = 'Set Famas rate of fire',
			["Args"] = {
				 -- 'Type' can be 'number', 'float', 'string', 'boolean', 'options'
				{["Name"] = 'RoF', ["Type"] = 'number', ["Optional"] = false, ["Choices"] = {}, ["Default"] = '3500'},
				{["Name"] = 'BurstRoF', ["Type"] = 'number', ["Optional"] = true, ["Choices"] = {}, ["Default"] = '7500'}
			},
			["ShareType"] = 'Shared',
			["Module"] = mmWeapons
		},
		["MinePower"] = {
			["Help"] = 'Set the blast power of the M15 AT Mine',
			["Args"] = {
				 -- 'Type' can be 'number', 'float', 'string', 'boolean', 'options'
				{["Name"] = 'Power', ["Type"] = 'number', ["Optional"] = false, ["Choices"] = {}, ["Default"] = '900000'},
			},
			["ShareType"] = 'Shared',
			["Module"] = mmWeapons
		}
	}
end

-- client
function MMConVars:RegisterConsoleCommands()
	for cvarName,conVar in pairs(self.cvars) do
		Console:Register(cvarName, self:GetUsage(cvarName), conVar.Module, conVar.Module['onValidate_'..cvarName])
	end
end

function MMConVars:RegisterEvents(shareType)
	if (shareType == nil) then shareType = 'Shared' end

	for cvarName,conVar in pairs(self.cvars) do

		local eventName = conVar.ShareType..'_'..cvarName

		if (conVar.ShareType == shareType) then
			NetEvents:Subscribe('MMConVars:'..eventName, conVar.Module, conVar.Module['on'..eventName])
		end
	end
end

function MMConVars:Get(cvarName)
	if (cvarName ~= nil) then
		return self.cvars[cvarName]
	else
		return self.cvars
	end
end

function MMConVars:GetUsage(cvarName, format)

	if (format == nil) then
		format = false
	end

	local conVar = self.cvars[cvarName]
	if (conVar == nil) then
		print('Console Variable not found: '..cvarName)
		return 'Console Variable not found: '..cvarName
	end

	if (format) then
		local usageStr = 'Usage: `vu-majorsmod.'..cvarName..'`'

		if (conVar.Args and #conVar.Args > 0) then
			for i=1, #conVar.Args do

				local argString = '<*'..conVar.Args[i].Name..'*|**'..conVar.Args[i].Type..'**|***'..conVar.Args[i].Default..'***>'

				if (conVar.Args[i].Optional == true) then
					argString = '['..argString..']'
				end

				usageStr = usageStr..' '..argString
			end
		end

		return usageStr
	else
		local usageStr = ''

		if (conVar.Args and #conVar.Args > 0) then
			for i=1, #conVar.Args do

				local argString = '<'..conVar.Args[i].Name..'|'..conVar.Args[i].Type..'|'..conVar.Args[i].Default..'>'

				if (conVar.Args[i].Optional == true) then
					argString = '['..argString..']'
				end

				usageStr = usageStr..' '..argString
			end
		end

		return usageStr..' '..conVar.Help
	end
end

function MMConVars:ValidateArgs(cvarName, args)
	local conVar = self.cvars[cvarName]

	if (conVar.Args and #conVar.Args > 0 and (args == nil or #args == 0)) then
		return mmConVars:GetUsage(cvarName, true)
	end

	for i=1, #conVar.Args do

		local reason = mmConVars:ValidateArgument(args[i], conVar.Args[i])

		if (reason ~= true) then
			return 'Argument '..i..' *'..conVar.Args[i].Name..'* Invalid: '..tostring(reason)
		end
	end

	NetEvents:SendLocal('MMConVars:'..conVar.ShareType..'_'..cvarName, args)
end

-- returns boolean true on success or string with failure message
function MMConVars:ValidateArgument(argValue, argParams)

	if (argValue == nil and argParams.IsOptional) then
		return true
	elseif (argParams.Type == 'number' or argParams.Type == 'float') then
		if (argValue ~= nil and tonumber(argValue) == nil) then
			return 'Must be a **'..argParams.Type..'**'
		end
	elseif (argParams.Type == 'choices') then

		for i=1, argParams.Choices do
			if (argValue ~= nil and argValue == argParams.Choices[i]) then
				return true
			end
		end
		return 'Not a valid **choice**'
	elseif (argParams.Type == 'string') then
		if (argValue == nil) then
			return 'Must be a **string**'
		end
	end
	return true
end


return MMConVars()