kernel = require '../lib/kernel'

module.exports.doSomething = (data) ->
 replylist=["Unknown Command", "Did you mean Narnia?","Error 404 Molise not found","Molise doesn't exists","Molisn't","WTF is Molise?","Did you mean Golfo del Molise?"]
 l=replylist.length
 d = Math.floor(Math.random() * l)
 message=replylist[d]
 kernel.sendMessage data.chat.id, message , (resp) ->
		console.log resp
