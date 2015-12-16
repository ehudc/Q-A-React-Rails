@Question = React.createClass
  convertTime: (time) ->
    startTimeISOString = time
    startTime = new Date(startTimeISOString)
    startTime.toString()

  render: ->
    R = React.DOM
    R.tr null,
      R.td null,
        R.a href: "#{@props.path}/#{@props.question.id}", @props.question.title
      R.td null, @props.question.content
      R.td null, @props.replies
      R.td null, @props.top
      R.td null, @props.question.views
      R.td null, @convertTime(@props.question.created_at)