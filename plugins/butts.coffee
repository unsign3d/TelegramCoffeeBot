kernel = require '../lib/kernel'
request = require 'request'

get_handler = (callback) ->
  options =
    method : 'GET'
    uri :"http://api.obutts.ru/noise/1"
    json : true

  request options, (err, resp, body) ->
    if !err && resp.statusCode == 200
      callback body  # Show the HTML for the Google homepage.
    else
      console.error "error in request"
      console.error body
      callback null


module.exports.doSomething = (data, option) ->
     get_handler  (body) ->
      kernel.sendPhoto data.chat.id, "http://media.obutts.ru/"+body[0].preview, '', '', '', (resp) ->
       console.log ""
   
