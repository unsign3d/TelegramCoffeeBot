kernel = require '../lib/kernel'

module.exports.doSomething = (data, option) ->
	if option == undefined
		kernel.sendMessage data.chat.id, "use of echo is /echo message", (resp) ->
			console.log resp
		return
	kernel.sendMessage data.chat.id, option, (resp) ->
		console.log resp
