kernel = require './kernel'
config = require '../config'

module.exports.takeAction = (cb) ->
  update = kernel.getUpdates (data) ->
    if data != null
      action = data.text.match(/\/([a-zA-z0-9]+)/gi)
      if action != null and config.plugins.indexOf action >= 0
        plugin = require '../plugins/'+action
        plugin.doSomething data
