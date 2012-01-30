class App.Views.Activity extends Backbone.View
  tag      : 'div'
  className: 'activity'

  initialize: ()->
    _.bindAll(@, "render")

    if @model.get('action') == "comment"
      @template = _.template App.Templates.CommentActivity
    else if @model.get('action') == "reopen"
      @template = _.template App.Templates.ReopenActivity
    else if @model.get('action') == "close"
      @template = _.template App.Templates.CloseActivity

    console.log "initialized activity view"


  render: ()->
    $(@el).html @template({
      message  : @model.get('message'),
      posted_at: @model.get('created_at'),
      user_name: "#{@model.get('user').first_name} #{@model.get('user').last_name}"
    })
    @
