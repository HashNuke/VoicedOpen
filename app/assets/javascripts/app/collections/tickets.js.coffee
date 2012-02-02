class App.Collections.Tickets extends Backbone.Collection

  model: App.Models.Ticket
  url  : "/tickets"

  initialize: ()->
    console.log "initialized collection"

  parse: (response)->
    @current_page  = response.page
    @total_tickets = response.total_tickets
    @per_page      = response.per_page
    return response.tickets

  total_pages: ()->
    Math.ceil(@total_tickets/@per_page)
