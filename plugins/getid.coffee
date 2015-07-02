kernel = require '../lib/kernel'

module.exports.doSomething = (data, option) ->
	id=data.from.id;
	kernel.sendMessage data.chat.id, "Your Telegram id is "+id, (resp) ->
		console.log resp
