@Post = React.createClass
  getInitialState: ->
    question: @props.question
    answers: @props.answers
  getDefaultProps: ->
    question: []

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
        'Question'
      R.table
        className: 'table table-bordered'
        R.thead null,
          R.tr null,
            R.th null, 'Title'
            R.th null, 'Content'
        R.tbody null,
          R.tr null,
            R.td null, @state.question.title
            R.td null, @state.question.content
      R.h2
        className: 'title'
        'Answers'
      React.createElement AnswerForm, handleNewAnswer: @addAnswer
      R.table
        className: 'table table-bordered'
        R.thead null,
          R.tr null,
            R.th null, 'Answer'
        R.tbody null,
          if @state.answers
            for answer in @state.answers by -1
              React.createElement Answer, key: answer.id, answer: answer
          else
            "No Answers Yet!"