@Question = React.createClass
  convertTime: (time) ->
    startTimeISOString = time
    startTime = new Date(startTimeISOString)
    startTime.toString()

  handleDelete: (e) ->
    self = @
    q_id = @props.question.id

    $.ajax({
      url: "/questions/#{q_id}",
      type: 'DELETE',
      data: { id: q_id },
      success: (data) ->
        self.props.handleDeleteQuestion q_id
    })

  render: ->
    {tr, td, a, div} = React.DOM
    tr null,
      td null,
        a href: "#{@props.path}/#{@props.question.id}", @props.question.title
      td null, @props.question.content
      td null, @props.replies
      td null, @props.top
      td null, @props.question.views
      td null, @convertTime(@props.question.created_at)
      td null,
        div
          className: 'btn-delete glyphicon glyphicon-remove'
          onClick: @handleDelete