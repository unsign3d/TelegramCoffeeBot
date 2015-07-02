kernel = require './kernel'
config = require '../config'

module.exports.takeAction = (cb) ->
  update = kernel.getUpdates (data) ->
    if data != null
      input = data.text.match(/\/([a-zA-z0-9]+)( *)([a-zA-z0-9]*)/gi)[0]
      input = input.split " "
      if input != null and input.constructor == Array
        action = input[0].substr 1
        options = input[1]

        if action != null and action in config.plugins
          plugin = require '../plugins/'+action
          plugin.doSomething data, options
