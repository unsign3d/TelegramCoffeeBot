redis = require 'redis'
kernel = require '../lib/kernel'
config = require '../config'


module.exports.doSomething = (data, option) ->
	if data.from.id in config.admin
		if option == null or option.indexOf(" ")==-1
			kernel.sendMessage data.chat.id, "I need 2 argumets: key and value", (resp) ->
		else

			console.log option
			console.log data.chat.id
			chatid = data.chat.id
			prekey= option.substr(0,option.indexOf(" "))
			key = prekey+":"+chatid
			option = option.substr(option.indexOf(' ')+1)
			console.log "il valore è "+option
			console.log "la chiave è: " + key
			client = redis.createClient()
			client.set key, option, redis.print
			client.get key, (err, reply) ->
			  client.quit()
			  kernel.sendMessage data.chat.id, prekey+" set to: "+reply, (resp) ->
	else
		kernel.sendMessage data.chat.id, "You do not have sufficient rights to perform this operation", (resp) ->
