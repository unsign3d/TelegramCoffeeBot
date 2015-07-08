kernel = require '../lib/kernel'

module.exports.doSomething = (data, option) ->
	if option == null || isNaN(option)
	 	max = 6
	else
	 	max = parseInt(option)
	 	max=max

	 
	d = Math.floor(Math.random() * (max))
	d=d+1
	kernel.sendMessage data.chat.id, "Dice rolled "+d, (resp) ->
		console.log resp
