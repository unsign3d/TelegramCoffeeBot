##
## This is the kernel lib of the bot, it contains all the functions
## author: Luca Bruzzone, me.unsigned.it
## thanks to: github.com/dlion
##


config = require '../config'
query   = require 'querystring'
request = require 'request'
formData = require 'form-data'
fs = require 'fs'

offset =  0

lastUpdate = (list) ->
  mes = list[list.length-1]
  if offset < mes.update_id
    console.log offset
    offset = mes.update_id
    console.log mes.update_id

    return mes.message
  else
    return null


# this is just a private function that make commands available
post_handler = (cmd, payload, callback) ->
  options =
    method : 'POST'
    uri : config.api_url+config.api_token+'/'+cmd
    body : payload
    json : true

  request options, (err, resp, body) ->
    if !err && resp.statusCode == 200
      callback body  # Show the HTML for the Google homepage.
    else
      console.error "error in request"
      callback null

get_handler = (cmd, callback) ->
  options =
    method : 'GET'
    uri : config.api_url+config.api_token+'/'+cmd
    json : true

  request options, (err, resp, body) ->
    if !err && resp.statusCode == 200
      callback body  # Show the HTML for the Google homepage.
    else
      console.error "error in request"
      callback null


# Use this method to receive incoming updates using long polling
module.exports.getUpdates = (cb) ->
  payload =
    offset: 7645647
  post_handler('getUpdates', payload, (data) ->
    cb(lastUpdate data.result))

# A simple method for testing your bot's auth token. Requires no parameters.
# Returns basic information about the bot in form of a User object.

module.exports.getMe = (cb) ->
  get_handler('getMe', (data)->
    cb data)

# Use this method to send text messages. On success, the sent Message is returned.
module.exports.sendMessage = (chat_id, message, cb) ->

  get_handler('sendMessage?chat_id='+chat_id+'&text='+message, (data) ->

    cb data )

# Use this method to forward message of any kind, on success, the sent Message is returned
module.exports.forwardMessage = (chat_id, from_chat_id, message_id, cb) ->
  payload =
    chat_id : chat_id
    from_chat_id : from_chat_id
    message_id : message_id

  post_handler('forwardMessage', payload, (data) ->
    cb data)

# Use this method to send photos. On success the sent message is returned
module.exports.sendPhoto = (chat_id, photo, caption, reply_to_message_id, reply_markup, cb) ->

  form =
    chat_id : chat_id
    photo : request photo
    caption: caption
    reply_to_message_id: reply_to_message_id
    reply_markup: reply_markup

  options =
    url : config.api_url+config.api_token+'/sendPhoto'
    formData: form

  request.post options, (err2, resp2, body2) ->
    if !err2 and resp2.statusCode == 200
        console.log "ok"
        cb resp2
      else
        console.log "no"
        console.log body2
        cb null

# Use this method to send audio files, if you want Telegram clients to display
# the file as a playable voice message. For this to work, your audio must be
# in an .ogg file encoded with OPUS (other formats may be sent as Document).
# On success, the sent Message is returned.

module.exports.sendAudio = (chat_id, audio, reply_to_message_id = '', reply_markup = '', cb) ->
    form =
      chat_id : chat_id
      audio : request audio
      caption: caption
      reply_to_message_id: reply_to_message_id
      reply_markup: reply_markup

    options =
      url : config.api_url+config.api_token+'/sendAudio'
      formData: form

    request.post options, (err2, resp2, body2) ->
      if !err2 and resp2.statusCode == 200
          console.log "ok"
          cb resp2
        else
          console.log "no"
          console.log body2
          cb null

# Use this method to send general files. On success, the sent Message is returned
module.exports.sendDocument = (chat_id, document, reply_to_message_id = '', reply_markup = '', cb) ->
    form =
      chat_id : chat_id
      audio : request audio
      caption: caption
      reply_to_message_id: reply_to_message_id
      reply_markup: reply_markup

    options =
      url : config.api_url+config.api_token+'/sendAudio'
      formData: form

    request.post options, (err2, resp2, body2) ->
      if !err2 and resp2.statusCode == 200
          console.log "ok"
          cb resp2
        else
          console.log "no"
          console.log body2
          cb null

# Use this method to send .webp stickers. On success, the sent Message is returned
module.exports.sendSticker = (chat_id, sticker, reply_to_message_id = '', reply_markup = '', cb) ->
    form =
      chat_id : chat_id
      sticker : request sticker
      caption: caption
      reply_to_message_id: reply_to_message_id
      reply_markup: reply_markup

    options =
      url : config.api_url+config.api_token+'/sendSticker'
      formData: form

    request.post options, (err2, resp2, body2) ->
      if !err2 and resp2.statusCode == 200
          console.log "ok"
          cb resp2
        else
          console.log "no"
          console.log body2
          cb null

# Use this method to send general files. On success, the sent Message is returned
module.exports.sendFiles = (chat_id, file, reply_to_message_id = '', reply_markup = '', cb) ->
    form =
      chat_id : chat_id
      files : request files
      caption: caption
      reply_to_message_id: reply_to_message_id
      reply_markup: reply_markup

    options =
      url : config.api_url+config.api_token+'/sendFiles'
      formData: form

    request.post options, (err2, resp2, body2) ->
      if !err2 and resp2.statusCode == 200
          console.log "ok"
          cb resp2
        else
          console.log "no"
          console.log body2
          cb null

# Use this method to send video files, Telegram client suppor mp4 videos.
# other format may be sent as Document On success, the sent Message is returned
module.exports.sendVideo = (chat_id, video, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : chat_id
    video : video
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendVideo', payload, (data) ->
    cb data)

# Use this method to send location. On success, the sent Message is returned
module.exports.sendLocation = (chat_id, latitude, longitude, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : chat_id
    latitude : latitude
    longitude: longitude
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendLocation', payload, (data) ->
    cb data)

# Use this method when you need to tell the user that something is happening on
# the bot's side. The status is set for 5 seconds or less (when a message arrives
# from your bot, Telegram clients clear its typing status).
module.exports.sendChatAction = (chat_id, action, cb) ->
  payload =
    chat_id : chat_id
    action : action

  post_handler('sendChatAction', payload, (data) ->
    cb data)

# Use this method to get a list of profile pictures for a user.
# Returns a UserProfilePhotos object
module.exports.getUserProfilePictures = (chat_id, user_id, offset = '', limit = '', cb) ->
  payload =
    chat_id : chat_id
    user_id : user_id
    offset : offset
    limit : limit

  post_handler('getUserProfilePictures', payload, (data) ->
    cb data)

module.exports.writeRedis = (val,key) ->
  redis = require('redis');
  client = redis.createClient(config.redis_port, config.redis_host, config.redis_options);
  console.log val 
  console.log key
  client.on 'ready', ->
    client.set key,val,redis.print
    client.end


module.exports.readRedis = (key)-> 
  redis = require('redis');
  client = redis.createClient(config.redis_port, config.redis_host, config.redis_options);
  client.on 'ready', ->
    client.get key, (err, reply) ->
      client.end
      console.log reply
      #return 
      reply
    


      
      




