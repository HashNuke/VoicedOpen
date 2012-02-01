class App.Models.Ticket extends Backbone.Model
  urlRoot: "/tickets"

  # relations: [{
  #   type: Backbone.HasOne,
  #   key : 'user',
  #   relatedModel: 'App.Models.User'
  # }]

  initialize: ()->
    console.log "initialized ticket"

  # parse: (response)=>
  #   user = new App.Models.User(response.ticketable)
  #   @set({"user", user})
  #   delete response.user

  #   response