@Post = React.createClass
  getInitialState: ->
    question: @props.question
    answers: @props.answers
  getDefaultProps: ->
    question: []
    answers: []

  updateVoteCount: (v) ->
    for ans in @props.answers
      if ans.id == v.id
        ans.votes = v.votes
        break
    @setState answers: @props.answers

  addAnswer: (a) ->
    if !@state.answers
      @state.answers = []
    answers = @state.answers.concat([a])
    @setState answers: answers

  render: ->
    R = React.DOM
    R.div
      className: 'questions'
      R.h2
        className: 'title'
        "Question " + "#{@state.question.id}"
      R.table
        className: 'question-list table table-bordered'
        R.thead null,
          R.tr null,
            R.th null, 'Subject'
            R.th null, 'Question'
        R.tbody null,
          R.tr null,
            R.td null, @state.question.title
            R.td null, @state.question.content
      R.h2
        className: 'title'
        'Answers'
      React.createElement AnswerForm, handleNewAnswer: @addAnswer, related: @props.question
      if @state.answers.length
        R.table
          className: 'answer-list table table-bordered'
          R.thead null,
            R.tr null,
              R.th null, 'Votes'
              R.th null, 'Answer'
              R.th null, 'Datetime'
          R.tbody null,
            for answer in @state.answers
              React.createElement Answer, handleVote: @updateVoteCount, key: answer.id, answer: answer
      else
        R.div
          className: 'empty-results'
          "No Answers Yet!"