@Question = React.createClass
  render: ->
    R = React.DOM
    R.tr null,
      R.td null,
        R.a href: "questions/#{@props.question.id}", @props.question.title
      R.td null, @props.question.content
      R.td null, @props.question.created_at