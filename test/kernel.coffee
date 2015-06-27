assert = require 'assert'
kernel = require '../lib/kernel'

# describe 'Kernel functions', () ->
#   it 'should return true if the connection is good', () ->
#     response =
#       ok : true,
#       result =
#         id : 97227097
#         first_name: "coffeebot"
#         username: "unsycoffeebot"
#     assert.equal kernel.getMe, response
kernel.getMe (data)->
  console.log data
