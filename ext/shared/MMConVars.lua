class "MMConVars"

function MMConVars:__init()
	self.moduleName = 'vu-majorsmod'
	self.cvars = {
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

-- shareType is case sensitive and must be 'Client' or 'Server'
function MMConVars:RegisterEvents(shareType)

	for cvarName,conVar in pairs(self.cvars) do
		local eventName = conVar.ShareType..'_'..cvarName

		if (conVar.ShareType == shareType or conVar.ShareType == 'Shared') then
			NetEvents:Subscribe('MMConVars:'..eventName, conVar.Module, conVar.Module['on'..eventName])
		end
	end

	if (shareType ~= 'Client') then
		NetEvents:Subscribe('MMConVars:SetServerValue', self, self.SetServerValue)
	end
end

-- a client call requests to set these values
function MMConVars:SetServerValue(player, args)
	print('MMConVars:SetServerValue ['..getModuleState()..']: '..dump(args))
	local conVar = self.cvars[args[1]]
	local eventName = conVar.ShareType..'_'..args[1]
	conVar["Value"] = args[2]
	conVar["RawValue"] = args[3]

	-- server is updated, now tell the client to apply
	NetEvents:BroadcastLocal('MMConVars:'..eventName, args[3])

	-- now apply them on the server
	conVar.Module['on'..eventName](conVar.Module, player, args[3])
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

-- returns array of current values for specified convar
-- if not set, returns default values provided to ...
function MMConVars:GetValue(cvarName, args)
	local conVar = self:Get(cvarName)

	print('MMConVars:GetValue ['..cvarName..']['..getModuleState()..']: '..dump(conVar.RawValue))
	print('MMConVars:GetValue [args]: '..dump(args))

	if (conVar == nil or conVar.RawValue == nil or #conVar.RawValue == 0) then
		return args
	end

	local values = {}

	for i=1, #conVar.RawValue do
		if (conVar.RawValue[i] == nil) then
			values[#values+1] = args[i]
		else
			values[#values+1] = conVar.RawValue[i]
		end
	end
	return values
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

	-- validate each argument, adding default values to missing or invalid arguments
	for i=1, #conVar.Args do
		local status = false

		args[i], status = mmConVars:ValidateArgument(args[i], conVar.Args[i])

		if (status ~= true) then
			return 'Argument '..i..' *'..conVar.Args[i].Name..'* Invalid: '..tostring(status)
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

	print('MMConVars:ValidateArgs ['..cvarName..']['..getModuleState()..']: '..dump(args))

	conVar["Value"] = storeValue
	conVar["RawValue"] = args

	-- client has updated its value, now tell the server to update
	NetEvents:SendLocal('MMConVars:SetServerValue', {cvarName, storeValue, args})
end

-- returns two values <value>,<status>
-- <value>: the validated value, with default applied if necessary
-- <status>: boolean true if valid, string with message if failed
function MMConVars:ValidateArgument(argValue, argParams)

	local defaultValue = argParams.Default

	if (argValue == nil and argParams.IsOptional) then

		return defaultValue, true

	elseif (argParams.Type == 'number' or argParams.Type == 'float') then

		if (argValue ~= nil and tonumber(argValue) == nil) then
			return defaultValue, 'Must be a **'..argParams.Type..'**'
		end

	elseif (argParams.Type == 'boolean') then

		if (argValue ~= nil) then -- sorry this is ugly
			if (argValue == '1' or argValue == '0' or
				string.lower(argValue) == 'true' or string.lower(argValue) == 'false' or
				string.lower(argValue) == 'y' or string.lower(argValue) == 'n') then

				-- the value still needs to be a string, but let's normalise it
				local booltostring = tostring((argValue == '1' or string.lower(argValue) == 'true' or string.lower(argValue) == 'y'))
				return booltostring, true
			end
		end

		return defaultValue, 'Not a valid **boolean**, use 1/0, true/false, or y/n'

	elseif (argParams.Type == 'choices') then

		for i=1, #argParams.Choices do
			if (argValue ~= nil and argValue == argParams.Choices[i]) then
				return argValue, true
			end
		end

		local choices = ''
		for i=1, argParams.Choices do
			if (string.len(choices) > 0) then
				choices = choices..', '
			end
			choices = choices..'*'..argParams.Choices[i]..'*'
		end

		return defaultValue, 'Not a valid **choice**, use: ['..choices..']'
	elseif (argParams.Type == 'string') then
		if (argValue == nil) then
			return defaultValue, 'Must be a **string**'
		end
	end
	return argValue, true
end


return MMConVars()