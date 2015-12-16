@Suggestion = React.createClass
  render: ->
    R = React.DOM
    R.tr null,
      R.td null,
        R.a href: "#{@props.path}/#{@props.suggestion.id}", @props.suggestion.title