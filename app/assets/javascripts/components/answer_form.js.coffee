@AnswerForm = React.createClass
  getInitialState: ->
    content: ''
    question_id: @props.related.id

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.content

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '/answers', { answer: @state }, (data) =>
      @props.handleNewAnswer data
      @setState @getInitialState()
    , 'JSON'

  render: ->
    R = React.DOM
    R.form
      onSubmit: @handleSubmit
      className: 'form-inline'
      R.div
        className: 'form-group'
        R.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Content'
          name: 'content'
          value: @state.content
          onChange: @handleChange
        R.input
          type: 'hidden'
          name: 'q_id'
          value: @state.question_id
      R.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Submit An Answer'