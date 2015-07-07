kernel = require './kernel'
config = require '../config'

module.exports.takeAction = (cb) ->
  update = kernel.getUpdates (data) ->
    if data != null
      input = data.text
      console.log input[0]
      if input[0]=="/"
        # is a command
        if input.indexOf(" ") >-1
          #the command has some options
          action = input.substr(0,input.indexOf(' '))
          options = input.substr(input.indexOf(' ')+1)
        else
          #no options specified for the command
          action = input
          options = null

        if action != null and action in config.plugins
          plugin = require '../plugins'+action
          plugin.doSomething data, options
        else
          #Unknown Command
          kernel.sendMessage data.chat.id, "Unknown command", (resp) ->
            console.log resp


