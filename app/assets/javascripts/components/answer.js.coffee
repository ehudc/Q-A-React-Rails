@Answer = React.createClass
  render: ->
    R = React.DOM
    R.tr null,
      R.td null, @props.answer.content