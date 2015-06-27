assert = require 'assert'
app = require '../lib/app'

# describe 'Kernel functions', () ->
#   it 'should return true if the connection is good', () ->
#     response =
#       ok : true,
#       result =
#         id : 97227097
#         first_name: "coffeebot"
#         username: "unsycoffeebot"
#     assert.equal kernel.getMe, response
console.log app
app.takeAction ()->
