kernel = require '../lib/kernel'
request = require 'request'

get_handler = (number, option, callback) ->
  options =
    method : 'GET'
    uri :"http://api.obutts.ru/butts/" + number + "/1/rank/"
    json : true

  request options, (err, resp, body) ->
    if !err && resp.statusCode == 200
      callback body  # Show the HTML for the Google homepage.
    else
      console.error "error in request"
      console.error body
      callback null


module.exports.doSomething = (data) ->
   number = Math.floor(Math.random() * 3000)

   get_handler number, (body) ->
     kernel.sendPhoto data.chat.id, "http://media.butts.ru/"+body[0].preview, '', '', '', (resp) ->
       console.log ""
