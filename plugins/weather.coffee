kernel = require '../lib/kernel'
request = require 'request'

get_handler = (option,callback) ->
  options =
    method : 'POST'
    uri :"http://api.openweathermap.org/data/2.5/weather?q="+option+"&units=metric"
    json : true
  request options, (err, resp, body) ->
    if !err && resp.statusCode == 200
      callback body  # Show the HTML for the Google homepage.
    else
      console.error "error in request"
      console.error body
      callback null
 
module.exports.doSomething = (data, option) ->
     if option == null 
        option = "Turin"
     get_handler  option, (body) ->
      if body.cod=="404"
         message= "City not found" 
      else
        city = body.name + ", "+body.sys.country
        console.log city
        message= "Condition in  "+city+" : "+body.weather[0].description
        message += "\n"
        message +="Temperature: " +body.main.temp
        message += " Celsius"
        message += "\n"
        message += "Wind speed: " +body.wind.speed 
        message += " m/s"
      kernel.sendMessage data.chat.id,message  , (resp) ->
        console.log resp
     
	   #console.log resp
 