class App.Models.Setting extends Backbone.Model
  url: ()->
    "/settings/#{@get('slug')}"

  initialize: ()->
    console.log "initialized setting"