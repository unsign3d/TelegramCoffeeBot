kernel = require '../lib/kernel'

module.exports.doSomething = (data, option) ->
	d = Math.floor(Math.random() * (6 - 1) + 1)
	kernel.sendMessage data.chat.id, "Dice rolled "+d, (resp) ->
		console.log resp
