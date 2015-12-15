@QuestionForm = React.createClass
  getInitialState: ->
    title: ''
    content: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  valid: ->
    @state.title && @state.content

  handleSubmit: (e) ->
    e.preventDefault()
    $.post '', { question: @state }, (data) =>
      @props.handleNewQuestion data
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
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
      R.div
        className: 'form-group'
        R.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Content'
          name: 'content'
          value: @state.content
          onChange: @handleChange
      R.button
        type: 'submit'
        className: 'btn btn-primary'
        disabled: !@valid()
        'Ask Question'