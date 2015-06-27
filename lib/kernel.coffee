##
## This is the kernel lib of the bot, it contains all the functions
## author: Luca Bruzzone, me.unsigned.it
## thanks to: github.com/dlion
##


config = require '../config'
query   = require 'querystring'
request = require 'request'

offset =  0

lastUpdate = (list) ->
  mes = list[list.length-1]
  if offset < mes.update_id
    offset = mes.update_id
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
      console.error body
      callabck null

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
      console.error body
      callback null


# Use this method to receive incoming updates using long polling
module.exports.getUpdates = (cb) ->
  payload =
    offset: 734575207
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
module.exports.sendPhoto = (photo, caption = '', reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : @chat_id
    photo : photo
    caption : caption
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendPhoto', payload, (data) ->
    cb data)

# Use this method to send audio files, if you want Telegram clients to display
# the file as a playable voice message. For this to work, your audio must be
# in an .ogg file encoded with OPUS (other formats may be sent as Document).
# On success, the sent Message is returned.

module.exports.sendAudio = (audio, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : @chat_id
    audio : audio
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendAudio', payload, (data) ->
    cb data)

# Use this method to send general files. On success, the sent Message is returned
module.exports.sendDocument = (document, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : @chat_id
    document : document
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendDocument', payload, (data) ->
    cb data)

# Use this method to send .webp stickers. On success, the sent Message is returned
module.exports.sendSticker = (sticker, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : @chat_id
    sticker : sticker
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendSticker', payload, (data) ->
    cb data)

# Use this method to send general files. On success, the sent Message is returned
module.exports.sendFiles = (file, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : @chat_id
    file : file
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendVideo', payload, (data)->
    cb data)

# Use this method to send video files, Telegram client suppor mp4 videos.
# other format may be sent as Document On success, the sent Message is returned
module.exports.sendVideo = (video, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : @chat_id
    video : video
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendVideo', payload, (data) ->
    cb data)

# Use this method to send location. On success, the sent Message is returned
module.exports.sendLocation = (latitude, longitude, reply_to_message_id = '', reply_markup = '', cb) ->
  payload =
    chat_id : @chat_id
    latitude : latitude
    longitude: longitude
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  post_handler('sendLocation', payload, (data) ->
    cb data)

# Use this method when you need to tell the user that something is happening on
# the bot's side. The status is set for 5 seconds or less (when a message arrives
# from your bot, Telegram clients clear its typing status).
module.exports.sendChatAction = (action, cb) ->
  payload =
    chat_id : @chat_id
    action : action

  post_handler('sendChatAction', payload, (data) ->
    cb data)

# Use this method to get a list of profile pictures for a user.
# Returns a UserProfilePhotos object
module.exports.getUserProfilePictures = (user_id, offset = '', limit = '', cb) ->
  payload =
    chat_id : @chat_id
    user_id : user_id
    offset : offset
    limit : limit

  post_handler('getUserProfilePictures', payload, (data) ->
    cb data)
