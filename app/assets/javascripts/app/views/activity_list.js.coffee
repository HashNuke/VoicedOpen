class App.Views.ActivityList extends Backbone.View
  className: 'activities'
  tag      : 'div'

  initialize: (options)->
    @ticket_id = options.ticket_id
    _.bindAll(@, "render")
    console.log "initialize activity list"

  refresh_list: ()->
    @collection.fetch({
      success: ()=>
        $(@el).empty()
        @render()
    })

  render: ()->
    @collection.each (activity)=>
      activity_view = new App.Views.Activity({model: activity})
      $(@el).append(activity_view.render().el)
    @