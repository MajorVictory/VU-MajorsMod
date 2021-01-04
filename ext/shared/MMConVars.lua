class "MMConVars"

function MMConVars:__init()
	self.moduleName = 'vu-majorsmod'
	self.cvars = {
		["FamasRoF"] = {
			["Help"] = 'Set Famas rate of fire',
			["Args"] = {
				{
					["Name"] = 'RoF',
					["Type"] = 'number',-- 'Type' can be 'number', 'float', 'string', 'boolean', 'options'
					["Optional"] = false,
					["Choices"] = {},
					["Default"] = '3500'
				},
				{
					["Name"] = 'BurstRoF',
					["Type"] = 'number',
					["Optional"] = true,
					["Choices"] = {},
					["Default"] = '7500'
				}
			},
			["ShareType"] = 'Shared',
			["Module"] = mmWeapons
		},
		["MinePower"] = {
			["Help"] = 'Set the blast power of the M15 AT Mine',
			["Args"] = {
				{
					["Name"] = 'Power',
					["Type"] = 'number',
					["Optional"] = false,
					["Choices"] = {},
					["Default"] = '900000'
				},
			},
			["ShareType"] = 'Shared',
			["Module"] = mmWeapons
		},
		["TestConvar"] = {
			["Help"] = 'An Example of each type of argument',
			["Args"] = {
				{
					["Name"] = 'setNumber',
					["Type"] = 'number',
					["Optional"] = false,
					["Choices"] = {},
					["Default"] = '5'
				},
				{
					["Name"] = 'setFloat',
					["Type"] = 'float',
					["Optional"] = false,
					["Choices"] = {},
					["Default"] = '0.3'
				},
				{
					["Name"] = 'setString',
					["Type"] = 'string',
					["Optional"] = false,
					["Choices"] = {},
					["Default"] = 'AStringValueNoSpaces'
				},
				{
					["Name"] = 'setBoolean',
					["Type"] = 'boolean',
					["Optional"] = false,
					["Choices"] = {},
					["Default"] = 'y' -- can be case insensitive: 1/0, true/false, y/n
				},
				{
					["Name"] = 'setChoice',
					["Type"] = 'choice',
					["Optional"] = false,
					["Choices"] = {
						'OptionA',
						'OptionB',
						'OptionC',
						'OptionD',
					},
					["Default"] = 'OptionB'
				}
			},
			["ShareType"] = 'Shared',
			["Module"] = self
		},
		["Help"] = {
			["Help"] = 'Prints the usage info for a registered command',
			["Args"] = {
				{
					["Name"] = 'cvarName',
					["Type"] = 'string',
					["Optional"] = false,
					["Choices"] = {},
					["Default"] = ''
				},
			},
			["ShareType"] = 'Shared',
			["Module"] = self
		},
	}

	-- init default values
	for cvarName,conVar in pairs(self.cvars) do

		local defaultValue = ''
		local defaultValueArray = {}
		if (self.cvars[cvarName].Args ~= nil) then
			for i=1, #self.cvars[cvarName].Args do
				if (string.len(defaultValue) > 0) then
					defaultValue = defaultValue..' '
				end
				defaultValue = defaultValue..self.cvars[cvarName].Args[i].Default
				defaultValueArray[#defaultValueArray+1] = self.cvars[cvarName].Args[i].Default
			end
		end

		self.cvars[cvarName].Value = defaultValue
		self.cvars[cvarName].RawValue = defaultValueArray
	end
end

-- example callback functions are formatted as <Module>:on<ShareType>_<cvarName>( player, args )
function MMConVars:onShared_TestConvar( player, args )
	print('onShared_TestConvar: '..dump(args))
end

function MMConVars:onShared_Help( player, args )
	print(mmConVars:GetUsage(args[1]), true)
end

-- run on client only
function MMConVars:RegisterConsoleCommands()
	for cvarName,conVar in pairs(self.cvars) do
		Console:Register(cvarName, self:GetUsage(cvarName), self:CreateCommandIssuer(cvarName))
	end
end

-- intermediary for validating arguments with given
function MMConVars:CreateCommandIssuer(cvarName)
	return function (args)
		return mmConVars:ValidateArgs(cvarName, args)
	end
end

-- shareType is case sensitive and must be 'Shared', 'Client', or 'Server'
function MMConVars:RegisterEvents(shareType)
	if (shareType == nil) then shareType = 'Shared' end

	for cvarName,conVar in pairs(self.cvars) do

		local eventName = conVar.ShareType..'_'..cvarName

		if (conVar.ShareType == shareType) then
			NetEvents:Subscribe('MMConVars:'..eventName, conVar.Module, conVar.Module['on'..eventName])
		end
	end
end

-- [cvarName] returns config settings for given conVar
-- [argName] if specified, returns argument config for given cvarName
function MMConVars:Get(cvarName, argName)
	if (cvarName ~= nil) then
		if (argName ~= nil) then

			local conVar = self.cvars[cvarName]

			if (conVar == nil or conVar.Args == nil) then
				return
			end

			for i=1, #conVar.Args do
				if (conVar.Args[i].Name == argName) then
					return conVar.Args[i]
				end
			end
			return
		else
			return self.cvars[cvarName]
		end
	else
		return self.cvars
	end
end

-- returns human readble usage string with optional [format]
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
		local usageStr = 'Usage: `'..self.moduleName..'.'..cvarName..'`'

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

	-- help arguments
	if (args ~= nil and #args > 0) then
		if (args[1] == '/?' or args[1] == '-?') then
			return mmConVars:GetUsage(cvarName, true)
		end
	end

	-- no arguments, but cvar wants something
	if (conVar.Args and #conVar.Args > 0 and (args == nil or #args == 0)) then
		-- has value, show it
		if (conVar.Value ~= nil) then
			return conVar.Value
		end

		-- no value, show usage
		return mmConVars:GetUsage(cvarName, true)
	end

	-- validate each argument
	for i=1, #conVar.Args do

		local reason = mmConVars:ValidateArgument(args[i], conVar.Args[i])

		if (reason ~= true) then
			return 'Argument '..i..' *'..conVar.Args[i].Name..'* Invalid: '..tostring(reason)
		end
	end

	-- generate argument string for stored value
	local storeValue = ''
	for i=1, #args do
		if (string.len(storeValue) > 0) then
			storeValue = storeValue..' '
		end
		storeValue = storeValue..args[i]
	end

	conVar["Value"] = storeValue
	conVar["RawValue"] = args

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
	elseif (argParams.Type == 'boolean') then

		if (argValue ~= nil) then
			if (argValue == '1' or argValue == '0' or
			string.lower(argValue) == 'true' or string.lower(argValue) == 'false' or
			string.lower(argValue) == 'y' or string.lower(argValue) == 'n') then
				return true
			end
		end
		return 'Not a valid **boolean**, use 1/0, true/false, or y/n'
	elseif (argParams.Type == 'choices') then

		for i=1, #argParams.Choices do
			if (argValue ~= nil and argValue == argParams.Choices[i]) then
				return true
			end
		end

		local choices = ''
		for i=1, argParams.Choices do
			if (string.len(choices) > 0) then
				choices = choices..', '
			end
			choices = choices..'*'..argParams.Choices[i]..'*'
		end

		return 'Not a valid **choice**, use: ['..choices..']'
	elseif (argParams.Type == 'string') then
		if (argValue == nil) then
			return 'Must be a **string**'
		end
	end
	return true
end


return MMConVars()