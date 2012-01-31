App.start = ()->
  window.router = new App.Router()
  Backbone.history.start()
  jQuery(".posted_at").timeago()

Backbone.View.prototype.close = ()->
  @remove()
  @unbind()
  if @onClose
    @onClose()
