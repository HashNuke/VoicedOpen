App = {
  Collections: {}
  Models     : {}
  Templates  : {}
  Views      : {}

  start: ()->
    console.log "started app"
    tickets = new App.Collections.Tickets()
    tickets.fetch()
    console.log tickets.models
}

_.templateSettings = {
  interpolate : /\{\{(.+?)\}\}/g
}

window.App = App