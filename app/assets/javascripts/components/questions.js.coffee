@Questions = React.createClass
  getInitialState: ->
    questions: @props.data
  getDefaultProps: ->
    questions: []

  addQuestion: (q) ->
    questions = @state.questions.concat([q])
    @setState questions: questions

  render: ->
    R = React.DOM
    R.div
      className: 'questions'
      R.h2
        className: 'title'
        'Questions'
      React.createElement QuestionForm, handleNewQuestion: @addQuestion
      R.table
        className: 'table table-bordered'
        R.thead null,
          R.tr null,
            R.th null, 'Title'
            R.th null, 'Content'
            R.th null, 'Date'
        R.tbody null,
          for question in @state.questions by -1
            React.createElement Question, key: question.id, question: question