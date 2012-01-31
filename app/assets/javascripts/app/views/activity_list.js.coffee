class App.Views.ActivityList extends Backbone.View
  className: 'activities'
  tag      : 'div'

  initialize: (options)->
    @ticket_id = options.ticket_id
    _.bindAll(@, "render")
    console.log "initialize activity list"

  render: ()->
    @collection.each (activity)=>
      activity_view = new App.Views.Activity({model: activity})
      $(@el).append(activity_view.render().el)
    new_comment_view = new App.Views.NewComment({ticket_id: @ticket_id})
    $(@el).append(new_comment_view.render().el) if App.Helpers.User.is_logged_in()
    @