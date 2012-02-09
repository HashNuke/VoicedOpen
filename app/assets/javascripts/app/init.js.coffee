App.start = ()->
  window.router = new App.Router()
  App.Controllers.Settings.sidebar()
  Backbone.history.start()

  search_view = new App.Views.Search()
  $(".search-wrapper").html search_view.render().el


Backbone.View.prototype.close = ()->
  @remove()
  @unbind()
  if @onClose
    @onClose()
