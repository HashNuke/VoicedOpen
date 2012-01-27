class App.Router extends Backbone.Router
  routes:
    "search/:term"                  :"search"
    "open_tickets/:page_number"     :"list_open_tickets"
    "closed_tickets/:page_number"   :"list_closed_tickets"
    "tickets/:ticket_id"            :"show_ticket"

  list_open_tickets: ()->
    console.log "get open tickets with #{arguments.length} args"

  list_closed_tickets: ()->
    console.log "get closed tickets with #{arguments.length} args"

  show_ticket: ()->
    console.log "get ticket with ticket id #{arguments.length} args"
