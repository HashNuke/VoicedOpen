class App.Views.Activity extends Backbone.View
  tag      : 'div'
  className: 'activity'

  initialize: ()->
    _.bindAll(@, "render")

    if @model.get('action') == "comment"
      @template = _.template App.Templates.CommentActivity
    else
      @template = _.template App.Templates.StatusActivity


  render: ()->
    console.log @model.get('user')
    $(@el).html @template({
      message  : @model.get('message'),
      posted_at: jQuery.timeago(@model.get('created_at')),
      user_name: "#{@model.get('actable').first_name} #{@model.get('actable').last_name}"
      action   : @model.get('action')
    })
    @
