class App.Controllers.Tickets

  @open_tickets: ()->
    console.log "open tickets"

  @closed_tickets: ()->
    console.log "closed tickets"

  @search_tickets: (term)->
    console.log "search tickets for #{term}"