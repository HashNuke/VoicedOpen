App.start = ()->
  window.router = new App.Router()
  Backbone.history.start()

Backbone.View.prototype.close = ()->
  @remove()
  @unbind()
  if @onClose
    @onClose()
