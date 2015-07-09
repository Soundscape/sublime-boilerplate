constants = require './constants'

module.exports =
  add: (item) ->
    @dispatch constants.PRODUCT.ADD, item

  edit: (id, item) ->
    @dispatch constants.PRODUCT.EDIT,
      id: id
      item: item

  remove: (id) ->
    @dispatch constants.PRODUCT.REMOVE,
      id: id

  fetch: () ->
    @dispatch constants.PRODUCT.FETCH
