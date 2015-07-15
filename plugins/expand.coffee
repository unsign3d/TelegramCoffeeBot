kernel = require '../lib/kernel'
googl = require 'goo.gl'
config = require '../config'

module.exports.doSomething = (data, option) ->
	RegExp pattern = new RegExp(/([--:\w?@%&+~#=]*\.[a-z]{2,4}\/{0,2})((?:[?&](?:\w+)=(?:\w+))+|[--:\w?@%&+~#=]+)?/ig)
	test=pattern.test(option)
	if test
		if (option.indexOf('http://goo.gl/') == -1)
			kernel.sendMessage data.chat.id, "not a goo.gl url", (resp) ->
		else
		  
			googl.setKey config.googl_apikey
			googl.expand(option).then((longUrl) ->
	  			kernel.sendMessage data.chat.id, longUrl, (resp) ->
	  			return
			).catch (err) ->
	  			console.error err.message
	  			return
