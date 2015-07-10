kernel = require '../lib/kernel'
config = require '../config'

module.exports.doSomething = (data, option) ->
	 message = "Available Commands \n"
		for plugin in config.plugins
			message+=plugin
			message +="\n"
	 kernel.sendMessage data.chat.id, message, (resp) ->
	    	  console.log resp

