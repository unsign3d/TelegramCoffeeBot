request = require 'request'
kernel = require '../lib/kernel'

exports.search = (options, callback)  ->
	d = Math.floor(Math.random() * (30))
	uri = "http://ajax.googleapis.com/ajax/services/search/images?v=1.0&q="+options+"&start="+d
	request uri, (err, res, body) ->
		if !err && res.statusCode == 200
			items = JSON.parse(body).responseData.results
			callback items
		else
			callback null

module.exports.doSomething = (data, option) ->
	RegExp pattern = new RegExp(/^[A-Za-z0-9 _]*[A-Za-z0-9][A-Za-z0-9 _]*$/)
	test=pattern.test(option)
	if test
		exports.search option, (body) ->
			if body == null
				kernel.sendMessage data.chat.id, "Error", (resp) ->
			else
			   d = Math.floor(Math.random() * (body.length))
			   if body[d] != undefined
			     	kernel.sendPhoto data.chat.id,body[d].url , '', '', '', (resp) ->
			   else
			   		kernel.sendMessage data.chat.id, "Image Not Found", (resp) ->

	else
	  kernel.sendMessage data.chat.id, "not a valid argument", (resp) ->

	     
     