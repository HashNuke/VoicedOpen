class App.Models.Activity extends Backbone.Model
  urlRoot: ()->
    "tickets/#{@ticket_id}/activities"


  initialize: (options)->
    @ticket_id = @get('ticket_id')
