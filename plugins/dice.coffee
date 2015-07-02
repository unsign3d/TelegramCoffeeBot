kernel = require '../lib/kernel'

module.exports.doSomething = (data) ->
	d = Math.floor(Math.random() * 7)
	kernel.sendMessage data.chat.id, "Dice rolled "+d, (resp) ->
		console.log resp
