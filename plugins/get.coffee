redis = require 'redis'
kernel = require '../lib/kernel'


module.exports.doSomething = (data, option) ->
	if option == null or option.indexOf(" ")>-1
		kernel.sendMessage data.chat.id, "Not a valid key", (resp) ->
	else
        chatid = data.chat.id
		key = option+":"+chatid
		client = redis.createClient()
		client.get key, (err, reply) ->
			  client.quit()
			  if reply == null
			  	kernel.sendMessage data.chat.id, "The key is not associated with any value", (resp) ->
			  else
			    kernel.sendMessage data.chat.id, reply, (resp) ->