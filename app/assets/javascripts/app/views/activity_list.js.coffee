class App.Views.ActivityList extends Backbone.View
  className: 'activities'
  tag      : 'div'

  initialize: ()->
    _.bindAll(@, "render")
    console.log "initialize activity list"

  render: ()->
    @collection.each (activity)=>
      activity_view = new App.Views.Activity({model: activity})
      $(@el).append(activity_view.render().el)
    @