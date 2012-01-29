class App.Views.TicketList extends Backbone.View
  tag      : "div"
  className: "ticket-list"

  initialize: ()->
    _.bindAll(@, "render")
    @open_ticket_template   = _.template App.Templates.OpenTicket
    @closed_ticket_template = _.template App.Templates.ClosedTicket

  render: ()->
    $ticket_list = $(@el)
    @collection.each (ticket)=>
      ticket_view = null;
      console.log @open_ticket_template
      if ticket.get("status") == "closed"
        ticket_view = @closed_ticket_template(ticket.toJSON())
      else
        ticket_view = @open_ticket_template(ticket.toJSON())

      $ticket_list.append(ticket_view)
    @