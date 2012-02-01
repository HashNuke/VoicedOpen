class App.Views.NewComment extends Backbone.View

  tag      : 'div'
  className: 'new-comment'

  events:
    "click .submit": "submit_comment"


  initialize: (options)->
    @activities_list    = options.activities_list
    @default_attributes = { ticket_id: options.ticket_id, action: "comment" }
    @model = new App.Models.Activity(@default_attributes)


  submit_comment: ()->
    @model.save({message: $(".new-comment-message").val()},{
      success: ()=>
        @activities_list.refresh_list()
        $(".new-comment-message").val("")
        @model = new App.Models.Activity(@default_attributes)
    })

  render: ()->
    $(@el).html App.Templates.NewComment
    @
