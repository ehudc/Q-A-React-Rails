@QuestionForm = React.createClass
  getInitialState: ->
    title: ''
    content: ''

  handleChange: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value

  handleChangeTitle: (e) ->
    name = e.target.name
    @setState "#{ name }": e.target.value
    @props.suggestions e.target.value

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
      R.div
        className: 'form-group'
        R.input
          type: 'text'
          className: 'form-control'
          placeholder: 'Title'
          name: 'title'
          value: @state.title
          onChange: @handleChange
          onBlur: @handleChangeTitle
      R.div
        className: 'form-group'
        R.textarea
          rows: '4'
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