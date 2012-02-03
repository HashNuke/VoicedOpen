class App.Models.Ticket extends Backbone.Model
  urlRoot: "/tickets"

  initialize: ()->
    console.log "initialized ticket"
