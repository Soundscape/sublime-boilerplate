t = require 'tcomb-form'
React = require 'react'
Router = require 'react-router'
RouteHandler = Router.RouteHandler
Link = Router.Link
Fluxxor = require 'fluxxor'
forms = require '../../forms'
schema = require '../../schema'
stores = require '../../stores'
$ = require 'jquery'
velocity = require 'velocity-animate'
uipack = require 'velocity-ui-pack'

EditView = React.createClass
  mixins: [
    Fluxxor.FluxMixin React
    Fluxxor.StoreWatchMixin 'product'
  ]

  contextTypes:
    router: React.PropTypes.func

  getStateFromFlux: () ->
    args = @context.router.getCurrentParams()
    store = @getFlux().store 'product'

    item: store.items[args.id]
    id: args.id

  componentWillReceiveProps: (nextProps) ->
    @setState @getStateFromFlux()

  componentDidMount: () ->
    el = @refs.container.getDOMNode()
    velocity el, opacity: 1, 300

  render: () ->
    item = @state.item;

    if !item
      return @renderNotFound()

    @renderWithLayout(
      <div className="row">
        <div className="col s12">
          <h4>Edit product</h4>
          <form onSubmit={@onSubmit}>
            <t.form.Form ref="form" type={schema.Product} options={forms.Product} value={item} />
            <button className="waves-effect waves-light btn" type="submit">
              Save
              <i className="material-icons right">save</i>
            </button>
          </form>
        </div>
      </div>
    )

  renderNotFound: () ->
    @renderWithLayout(
      <div className="row" ref="container" style={opacity: 0}>
        <div className="col s12">
          <p className="flow-text">That item was not found.</p>
        </div>
      </div>
    )

  renderWithLayout: (content) ->
    (
      <div className="row" ref="container" style={opacity: 0}>
        <div className="col s12">
          {content}
          <div className="fixed-action-btn" style={bottom: '45px', right: '24px'}>
            <a className="btn-floating btn-large red">
              <i className="large material-icons">more_vert</i>
            </a>
            <ul>
              <li><Link className="btn-floating green waves-effect waves-light" to="home" style={marginRight: '.5em'}><i className="material-icons">home</i></Link></li>
              <li><Link className="btn-floating blue waves-effect waves-light" to="add-item" style={marginRight: '.5em'}><i className="material-icons">add</i></Link></li>
              <li><Link className="btn-floating red waves-effect waves-light" to="home" onClick={@deleteItem} style={marginRight: '.5em'}><i className="material-icons">delete</i></Link></li>
            </ul>
          </div>
        </div>
      </div>
    )

  onSubmit: (e) ->
    e.preventDefault()

    item = @refs.form.getValue()
    if (item)
      @getFlux().actions.product.edit @state.id, item
      @context.router.transitionTo 'item', id: @state.id

  deleteItem: (e) ->
    if (confirm 'Really delete this item?')
      @getFlux().actions.product.remove @state.id
    else
      e.preventDefault()

module.exports = EditView
