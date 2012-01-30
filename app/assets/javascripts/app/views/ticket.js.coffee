class App.Views.Ticket extends Backbone.View

  tag      : "div"
  className: "ticket"

  initialize: ()->
    _.bindAll(@, "render")
    @template = _.template App.Templates.Ticket


  render: ()->
    if @model.get("status")=="closed"
      App.Helpers.TicketStatus.set_to_closed()
    else
      App.Helpers.TicketStatus.set_to_open()

    compiled_template = @template({
      id        : @model.get("id")
      title     : @model.get("title"),
      user_name : "#{@model.get('user').get('first_name')} #{@model.get('user').get('last_name')}",
      message   : @model.get("message"),
      posted_at : @model.get("created_at")
    })

    $(@el).html(compiled_template)

    activities = new App.Collections.Activities({ticket_id: @model.get('id')})
    activities.fetch({
      success: ()->
        $activities = $(".activities")
        activities.each (activity)->
          activity_view = new App.Views.Activity({model: activity})
          $activities.append(activity_view.render().el)
    })
    @
