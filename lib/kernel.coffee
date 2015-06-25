##
## This is the kernel lib of the bot, it contains all the functions
## author: Luca Bruzzone, me.unsigned.it
## thanks to: github.com/dlion
##


config = require '../config'
query   = require 'querystring'
request = require 'request'

chat_id = 0



# this is just a private function that make commands available
url_handler = (cmd, payload = '') ->
  options =
    method : 'POST'
    url : 'config.api_url+config.api_token+'/'+cmd'
    body : payload
    json : true

  request options, (err, resp, body) ->
    if !err and resp.stauscode == 200
      yeld null, body
    else
      yeld err, null

#Set the chat id
module.exports.setChatId = (chat_id) ->
  @chat_id = chat_id

# Use this method to receive incoming updates using long polling
module.exports.getUpdates = () ->
  return url_handler('getUpdates')

# A simple method for testing your bot's auth token. Requires no parameters.
# Returns basic information about the bot in form of a User object.

module.exports.getMe = () ->
  return url_handler('getMe')

# Use this method to send text messages. On success, the sent Message is returned.
module.exports.sendMessage = (message) ->
  payload =
    chat_id : @chat_id
    text : message

  return url_handler('setMessage', payload)

# Use this method to forward message of any kind, on success, the sent Message is returned
module.exports.forwardMessage = (from_chat_id, message_id) ->
  payload =
    chat_id : @chat_id
    from_chat_id : from_chat_id
    message_id : message_id

  return url_handler('forwardMessage', payload)

# Use this method to send photos. On success the sent message is returned
module.exports.sendPhoto = (photo, caption = '', reply_to_message_id = '', reply_markup = '') ->
  payload =
    chat_id : @chat_id
    photo : photo
    caption : caption
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  return url_handler('sendPhoto', payload)

# Use this method to send audio files, if you want Telegram clients to display
# the file as a playable voice message. For this to work, your audio must be
# in an .ogg file encoded with OPUS (other formats may be sent as Document).
# On success, the sent Message is returned.

module.exports.sendAudio = (audio, reply_to_message_id = '', reply_markup = '') ->
  payload =
    chat_id : @chat_id
    audio : audio
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  return url_handler('sendAudio', payload)

# Use this method to send general files. On success, the sent Message is returned
module.exports.sendDocument = (document, reply_to_message_id = '', reply_markup = '') ->
  payload =
    chat_id : @chat_id
    document : document
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  return url_handler('sendDocument', payload)

# Use this method to send .webp stickers. On success, the sent Message is returned
module.exports.sendSticker = (sticker, reply_to_message_id = '', reply_markup = '') ->
  payload =
    chat_id : @chat_id
    sticker : sticker
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  return url_handler('sendSticker', payload)

# Use this method to send general files. On success, the sent Message is returned
module.exports.sendVideo = (video, reply_to_message_id = '', reply_markup = '') ->
  payload =
    chat_id : @chat_id
    video : video
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  return url_handler('sendVideo', payload)

# Use this method to send video files, Telegram client suppor mp4 videos.
# other format may be sent as Document On success, the sent Message is returned
module.exports.sendVideo = (video, reply_to_message_id = '', reply_markup = '') ->
  payload =
    chat_id : @chat_id
    video : video
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  return url_handler('sendVideo', payload)

# Use this method to send location. On success, the sent Message is returned
module.exports.sendLocation = (latitude, longitude, reply_to_message_id = '', reply_markup = '') ->
  payload =
    chat_id : @chat_id
    latitude : latitude
    longitude: longitude
    reply_to_message_id : reply_to_message_id
    reply_markup : reply_markup

  return url_handler('sendLocation', payload)

# Use this method when you need to tell the user that something is happening on
# the bot's side. The status is set for 5 seconds or less (when a message arrives
# from your bot, Telegram clients clear its typing status).
module.exports.sendChatAction = (action) ->
  payload =
    chat_id : @chat_id
    action : action

  return url_handler('sendChatAction', payload)

# Use this method to get a list of profile pictures for a user.
# Returns a UserProfilePhotos object
module.exports.getUserProfilePictures = (user_id, offset = '', limit = '') ->
  payload =
    chat_id : @chat_id
    user_id : user_id
    offset : offset
    limit : limit

  return url_handler('getUserProfilePictures', payload)
