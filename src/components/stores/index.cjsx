RouteStore = require './route'
ProductStore = require './product'

module.exports =
  route: new RouteStore()
  product: new ProductStore()
