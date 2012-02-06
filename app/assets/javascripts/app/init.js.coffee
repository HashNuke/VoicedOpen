App.start = ()->
  window.router = new App.Router()
  Backbone.history.start()

  search_view = new App.Views.Search()
  $(".search-wrapper").html search_view.render().el

  setting = new App.Models.Setting({id: 1})
  setting.fetch({success: ()->
    setting_view = new App.Views.Setting({model: setting})
    $(".sidebar .content").html setting_view.render().el
    $(".update-form").hide()
    $(".sidebar-desc").html setting.get('value')
  })


  # jQuery(".posted_at").timeago()

Backbone.View.prototype.close = ()->
  @remove()
  @unbind()
  if @onClose
    @onClose()
