@Answer = React.createClass
  convertTime: (time) ->
    startTimeISOString = time
    startTime = new Date(startTimeISOString)
    startTime.toString()

  handleUpVote: (e) ->
    self = @
    e.preventDefault()
    $.ajax({
      url: "/answers/#{@props.answer.id}",
      type: 'PUT',
      data: {vote: 1},
      success: (data) ->
        console.log data
        self.props.handleVote data
    })

  handleDownVote: (e) ->
    self = @
    e.preventDefault()
    $.ajax({
      url: "/answers/#{@props.answer.id}",
      type: 'PUT',
      data: {vote: -1},
      success: (data) ->
        console.log data
        self.props.handleVote data
    })

  render: ->
    R = React.DOM
    R.tr null,
      R.td null,
        R.span
          className: 'arrow arrow-up'
          onClick: @handleUpVote
        R.span
          className: 'arrow arrow-down'
          onClick: @handleDownVote
        R.span
          className: 'vote-count'
          @props.answer.votes
      R.td null, @props.answer.content
      R.td null, @convertTime(@props.answer.created_at)