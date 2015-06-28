kernel = require '../lib/kernel'
request = require 'request'

get_handler = (callback) ->
  options =
    method : 'GET'
    uri : "https://xkcd.com/614/info.0.json"
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

   get_handler (body) ->

     kernel.sendPhoto data.chat.id, body.img, '', '', '', (resp) ->
       console.log ""
