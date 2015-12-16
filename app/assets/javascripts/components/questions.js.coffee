@Questions = React.createClass
  getInitialState: ->
    path: @props.path
    questions: @props.data
    answers: @props.answers
    suggestions: []
  getDefaultProps: ->
    questions: []
    answers: []
    suggestions: []

  addQuestion: (q) ->
    questions = @state.questions.concat([q])
    @setState questions: questions

  getSuggestions: (input) ->
#    No score for words yet
    existing = []
    if input
      words = input.split(" ")
      for question in @state.questions
        for str in words
          re = RegExp(str, 'i');
          if question.title.match(re)
            existing = existing.concat([
              {
                id: question.id,
                title: question.title
              }
            ])
    @setState suggestions: existing

  getAnswerCount: (id) ->
    count = 0
    for reply in @props.answers
      if reply['question_id'] == id
        count++
    count

  getTopCount: (id) ->
    max = 0
    for reply in @props.answers
      if reply['question_id'] == id and reply['votes'] > max
        max = reply['votes']
    max

  render: ->
    console.log(@props.questionsPath)
    R = React.DOM
    R.div
      className: 'questions'
      R.h2
        className: 'title'
        'Questions'
      if @state.suggestions.length
        R.table
          className: 'suggestions'
          R.thead null,
            R.tr null,
              R.th null, 'Suggested Questions Based On Your Title:'
          R.tbody null,
            for suggestion in @state.suggestions
              React.createElement Suggestion,
                key: suggestion.id,
                path: @state.path,
                suggestion: suggestion

      React.createElement QuestionForm, handleNewQuestion: @addQuestion, suggestions: @getSuggestions

      if @state.questions.length
        R.table
          className: 'question-list table table-bordered'
          R.thead null,
            R.tr null,
              R.th null, 'Title'
              R.th null, 'Content'
              R.th null, 'Answers'
              R.th null, 'Highest Voted Answer Count'
              R.th null, 'Views'
              R.th null, 'Date'
          R.tbody null,
            for question in @state.questions by -1
              React.createElement Question,
                key: question.id,
                question: question,
                path: @state.path,
                top: @getTopCount(question.id),
                replies: @getAnswerCount(question.id)
      else
        R.div
          className: 'empty-results'
          "No Questions Yet!"