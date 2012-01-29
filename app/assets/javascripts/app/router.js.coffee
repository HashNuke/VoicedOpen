class App.Router extends Backbone.Router
  routes:
    ""                      : "open_tickets"
    "tickets/search/:term"  : "search"
    "tickets/new"           : "new_ticket"

    "tickets/open/:page"    : "open_tickets"
    "tickets/open"          : "open_tickets"

    "tickets/closed/:page"  : "closed_tickets"
    "tickets/closed"        : "closed_tickets"

    "tickets/:ticket_id"    : "show_ticket"


  new_ticket: ()->
    App.Controllers.Tickets.new_ticket()

  open_tickets: ()->
    if arguments.length > 0
      App.Controllers.Tickets.open_tickets(arguments.first)
    else
      App.Controllers.Tickets.open_tickets()

  closed_tickets: ()->
    if arguments.length > 0
      App.Controllers.Tickets.closed_tickets(arguments.first)
    else
      App.Controllers.Tickets.closed_tickets()

  show_ticket: (ticket_id)->
    App.Controllers.Tickets.show_ticket(ticket_id)