kernel = require '../lib/kernel'

module.exports.doSomething = (data, option) ->
	if option == null || isNaN(option)
	 	max = 6
	else
	 	max = parseInt(option)
	 	if max > 100
	 		max = 100
	d = Math.floor(Math.random() * (max))
	d=d+1
	kernel.sendMessage data.chat.id, "Dice rolled "+d, (resp) ->
		console.log resp
