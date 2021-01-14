
require('__shared/MMUtils')

-- load resource list
mmResources = require('__shared/MMResources')

-- modules
mmPlayers = require('__shared/MMPlayers')
mmWeapons = require('__shared/MMWeapons')
mmVehicles = require('__shared/MMVehicles')
mmLevelManager = require('__shared/MMLevelManager')

-- register console variables
mmConVars = require('__shared/MMConVars')
mmConVars:RegisterEvents('Server')

myRconVars = {
	["testmodcommand"] = 'novalue'
}

RCON:RegisterCommand('vars.testmodcommand', RemoteCommandFlag.None, function(command, args, loggedIn)
	myRconVars.testmodcommand = args[1]
    print('vars.testmodcommand new value: '..tostring(myRconVars.testmodcommand))
	return {'OK', myRconVars.testmodcommand}
end)

Events:Subscribe('Engine:Init', function()
	-- prints 'novalue', Startup.txt has not been parsed yet
    print('Engine:Init: '..tostring(myRconVars.testmodcommand))
end)
Events:Subscribe('Level:LoadingInfo', function()
	-- prints 'foo', Startup.txt has been read
    print('Level:LoadingInfo: '..tostring(myRconVars.testmodcommand))
end)