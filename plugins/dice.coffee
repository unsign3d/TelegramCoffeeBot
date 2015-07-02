kernel = require '../lib/kernel'

<<<<<<< HEAD
module.exports.doSomething = (data) ->
	d = Math.floor(Math.random() * 7)
=======
module.exports.doSomething = (data, option) ->
	d = Math.floor(Math.random() * (6 - 1) + 1)
>>>>>>> upstream/master
	kernel.sendMessage data.chat.id, "Dice rolled "+d, (resp) ->
		console.log resp
