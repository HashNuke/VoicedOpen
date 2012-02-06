class App.Models.Setting extends Backbone.Model
  urlRoot: "/settings"

  initialize: ()->
    console.log "initialized setting"