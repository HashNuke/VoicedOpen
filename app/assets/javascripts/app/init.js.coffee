App.start = ()->
  window.router = new App.Router()
  Backbone.history.start()

Backbone.View.prototype.close = ()->
  @remove()
  @unbind()
  if @onClose
    @onClose()


$(document).ready ()->

  $(".open-tickets a").click (e)=>
    $(".open-tickets").addClass("active") if not $(".open-tickets").hasClass("active")
    $(".closed-tickets").removeClass("active") if $(".closed-tickets").hasClass("active")

  $(".closed-tickets a").click (e)=>
    $(".closed-tickets").addClass("active") if not $(".closed-tickets").hasClass("active")
    $(".open-tickets").removeClass("active") if $(".open-tickets").hasClass("active")
