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
      if ticket.get("status") == "closed"
        ticket_view = @closed_ticket_template({
          id        : ticket.get("id")
          title     : ticket.get("title"),
          user_name : "#{ticket.get('ticketable').first_name} #{ticket.get('ticketable').last_name}",
          posted_at : jQuery.timeago(ticket.get("created_at"))
        })
      else
        ticket_view = @open_ticket_template({
          id        : ticket.get("id")
          title     : ticket.get("title"),
          user_name : "#{ticket.get('ticketable').first_name} #{ticket.get('ticketable').last_name}",
          posted_at : jQuery.timeago(ticket.get("created_at"))
        })

      $ticket_list.append(ticket_view)
    @