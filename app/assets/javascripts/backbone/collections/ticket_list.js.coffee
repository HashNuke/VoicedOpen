class App.Collections.Tickets extends Backbone.Collection
  model: App.Models.Ticket
  url  : "/tickets"

  initialize: ()->
    console.log "initialized collection"
