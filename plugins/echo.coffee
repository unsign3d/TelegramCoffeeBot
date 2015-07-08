kernel = require '../lib/kernel'
config= require '../config'

module.exports.doSomething = (data, option) ->
	if option == null 
		kernel.sendMessage data.chat.id, "use of echo is /echo message", (resp) ->
			console.log resp
		return
    
	for plugin in config.plugins
		if option.indexOf(plugin)> -1
			test = 1
	if test == 1
		message= "I won't go into a loop"
	else
		message = option
	kernel.sendMessage data.chat.id, message, (resp) ->
		console.log resp
