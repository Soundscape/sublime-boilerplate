React = require 'react'
Router = require 'react-router'
Route = Router.Route
DefaultRoute = Router.DefaultRoute
views = require '../views'

routes = (
  <Route handler={views.product.EmptyView} name="home" path="/">
    <Route handler={views.product.AddView} name="add-item" path="/product/add" />

    <Route handler={views.product.EmptyView} path="/product/:id">
      <Route handler={views.product.EditView} name="edit-item" path="edit" />
      <DefaultRoute handler={views.product.ItemView} name="item" />
    </Route>

    <DefaultRoute handler={views.product.ListView} />
  </Route>
)

module.exports = routes
