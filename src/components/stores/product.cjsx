Fluxxor = require 'fluxxor'
Net = require 'sublime-net'
actions = require '../actions'

ProductStore = Fluxxor.createStore
  initialize: (options) ->
    @items = {}
    @id = null

    @bindActions(
      actions.constants.PRODUCT.FETCH, @fetch
      actions.constants.PRODUCT.ADD, @add
      actions.constants.PRODUCT.EDIT, @edit
      actions.constants.PRODUCT.REMOVE, @remove
    )

    @fetch()

  fetch: () ->
    @emit 'change'

  add: (payload) ->
    @emit 'change'

  edit: (payload) ->
    @emit 'change'

  remove: (payload) ->
    @emit 'change'

module.exports = ProductStore
