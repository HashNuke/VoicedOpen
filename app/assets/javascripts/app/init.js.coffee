App.start = ()->
  window.router = new App.Router()
  Backbone.history.start()
  search_view = new App.Views.Search()
  $(".search-wrapper").html search_view.render().el
  # jQuery(".posted_at").timeago()

Backbone.View.prototype.close = ()->
  @remove()
  @unbind()
  if @onClose
    @onClose()
