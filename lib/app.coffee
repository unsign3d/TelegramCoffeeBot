kernel = require './kernel'

module.exports.takeAction = (cb) ->
  update = kernel.getUpdates (data) ->
    action = data.text.replace(/[^\w\s]/gi, '')
    console.log action
    plugin = require '../plugins/'+action
    plugin.doSomething data
