class App.Models.Ticket extends Backbone.Model
  initialize: ()->
    console.log "initialized ticket"
    console.log @get("title")
