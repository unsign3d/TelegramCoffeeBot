kernel = require '../lib/kernel'
request = require 'request'

get_handler = (number, callback) ->
  console.error number
  if isNaN number
    url = "https://xkcd.com/info.0.json"
  else
    url = "https://xkcd.com/"+number+"/info.0.json"

  console.log url

  options =
    method : 'GET'
    uri : url
    json : true

  request options, (err, resp, body) ->
    if !err && resp.statusCode == 200
      callback body  # Show the HTML for the Google homepage.
    else
      console.error "error in request"
      console.error body
      callback null


module.exports.doSomething = (data, option) ->
   if option == undefined
     number = "ultimo"
   else
     number = option

   get_handler number, (body) ->

     kernel.sendPhoto data.chat.id, body.img, '', '', '', (resp) ->
       console.log ""
