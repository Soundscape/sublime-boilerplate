React = require 'react'
t = require 'tcomb-form'
schema = require '../schema'
Product = schema.Product

struct = (locals)  ->
  inputs = locals.inputs

  return (
    <div className="form-struct product">
      <div className="form-row title">
        {inputs.title}
      </div>
      <div className="form-row summary">
        {inputs.summary}
      </div>
    </div>
  )

module.exports =
  auto: 'none'
  templates:
    struct: struct

  fields:
    title:
      label: 'Title'
      attrs:
        required: true
        validate: true
        name: 'title'
    summary:
      type: 'textarea'
      label: 'Summary'
      attrs:
        required: true
        validate: true
        name: 'summary'
