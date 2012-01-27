class App.Views.TicketList extends Backbone.View
  tag      : "div"
  className: "ticket-list"

  initialize: ()->
    _.bindAll(@, "render")

  render: ()->
    $ticket_list = $(@el)
    @collection.each (ticket)->
      ticket_view = null;
      if ticket.get("status") == "closed"
        ticket_view = new App.views.ClosedTicket({model: ticket, collection: @collection})
      else
        ticket_view = new App.Views.OpenTicket({model: ticket, collection: @collection})

      $ticket_list.append(ticket_view.render().el)
    @