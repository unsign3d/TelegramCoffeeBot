kernel = require './kernel'
config = require '../config'

module.exports.takeAction = (cb) ->
  update = kernel.getUpdates (data) ->
    if data != null
      action = data.text.match(/\/([a-zA-z0-9]+)/gi)
      if action != null and action.constructor == Array
        action = action[0].substr 1
        console.log action
        if action != null and action in config.plugins
          plugin = require '../plugins/'+action
          plugin.doSomething data
