kernel = require './kernel'

module.exports.takeAction = () ->
  update = kernel.getUpdates
  if update.
