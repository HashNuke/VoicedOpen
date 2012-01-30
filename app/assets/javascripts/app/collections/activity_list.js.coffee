class App.Collections.Activities extends Backbone.Collection
  model: App.Models.Activity
  url  : ()->
"/tickets/#{@options.ticket_id}/activities"

  initialize: ()->
    console.log "initialized collection"