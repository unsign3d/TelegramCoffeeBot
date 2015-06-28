kernel = require './kernel'

module.exports.takeAction = (cb) ->
  update = kernel.getUpdates (data) ->
    action = data.text.match(/\/([a-zA-z0-9]+)/gi)
    if action != null
      plugin = require '../plugins/'+action
      plugin.doSomething data
    else
