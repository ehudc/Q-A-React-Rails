@Questions = React.createClass
  getInitialState: ->
    questions: @props.data
    answers: @props.answers
  getDefaultProps: ->
    questions: []
    answers: []

  addQuestion: (q) ->
    questions = @state.questions.concat([q])
    @setState questions: questions

  getAnswerCount: (id) ->
    count = 0
    for reply in @props.answers
      if reply['question_id'] == id
        count++
    count

  render: ->
    R = React.DOM
    R.div
      className: 'questions'
      R.h2
        className: 'title'
        'Questions'
      React.createElement QuestionForm, handleNewQuestion: @addQuestion
      if @state.questions.length
        R.table
          className: 'table table-bordered'
          R.thead null,
            R.tr null,
              R.th null, 'Title'
              R.th null, 'Content'
              R.th null, 'Date'
              R.th null, 'Answers'
              R.th null, 'Views'
          R.tbody null,
            for question in @state.questions by -1
              React.createElement Question, key: question.id, question: question, replies: @getAnswerCount(question.id)
      else
        "No Questions Yet!"