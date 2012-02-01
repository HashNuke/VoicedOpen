class App.Collections.Activities extends Backbone.Collection
  model: App.Models.Activity
  url  : ()->
    "/tickets/#{@options.ticket_id}/activities"

  initialize: (options)->
    @options = options
    console.log "initialized collection #{options.ticket_id}"