class App.Helpers.TicketListStatus
  @set_to_open: ()->
    $(".open-tickets").addClass("active") if not $(".open-tickets").hasClass("active")
    $(".closed-tickets").removeClass("active") if $(".closed-tickets").hasClass("active")

  @set_to_closed: ()->
    $(".closed-tickets").addClass("active") if not $(".closed-tickets").hasClass("active")
    $(".open-tickets").removeClass("active") if $(".open-tickets").hasClass("active")