kernel = require '../lib/kernel'
googl = require 'goo.gl'
config = require '../config'

#Shorten an url using the goo.gl API require a google API key
 
module.exports.doSomething = (data, option) ->
  RegExp pattern = new RegExp(/([--:\w?@%&+~#=]*\.[a-z]{2,4}\/{0,2})((?:[?&](?:\w+)=(?:\w+))+|[--:\w?@%&+~#=]+)?/ig)
  test=pattern.test(option)
  if test

	  googl.setKey config.googl_apikey
	  googl.shorten(option).then((shortUrl) ->
		  kernel.sendMessage data.chat.id, shortUrl, (resp) ->
	    	  console.log resp
		  return
	  ).catch (err) ->
		  console.error err.message
		  return
  else
  	kernel.sendMessage data.chat.id, "not a valid url", (resp) ->
	    	  console.log resp

		