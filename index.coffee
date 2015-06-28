app  = require './lib/app'

action = ()->
  app.takeAction () ->

console.log action
setInterval(action, 500);
