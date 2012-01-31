class App.Views.NewComment extends Backbone.View

  tag      : 'div'
  className: 'new-comment'

  events:
    "click .submit": "submit_comment"


  initialize: (options)->
    @model = new App.Models.Activity({action: "comment", ticket_id: options.ticket_id})
    console.log "new comment view"


  submit_comment: ()->
    console.log "submission bob"
    @model.save({message: $('.new-comment-message').val()})

  render: ()->
    $(@el).html App.Templates.NewComment
    @
