class App.Router extends Backbone.Router

  initialize: ()->
    @view_handler = new App.Helpers.ViewHandler()

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
    App.Controllers.Tickets.new_ticket(@view_handler)

  open_tickets: ()->
    console.log "open tickets show"
    if arguments.length > 0
      App.Controllers.Tickets.open_tickets(@view_handler, arguments.first)
    else
      App.Controllers.Tickets.open_tickets(@view_handler)

  closed_tickets: ()->
    if arguments.length > 0
      App.Controllers.Tickets.closed_tickets(@view_handler, arguments.first)
    else
      App.Controllers.Tickets.closed_tickets(@view_handler)

  show_ticket: (ticket_id)->
    App.Controllers.Tickets.show_ticket(@view_handler, ticket_id)