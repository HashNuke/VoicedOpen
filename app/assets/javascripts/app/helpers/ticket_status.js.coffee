class App.Helpers.TicketStatus
  @set_to_open: ()->
    console.log "set status to open"
    $(".open-tickets").addClass("active") if not $(".open-tickets").hasClass("active")
    $(".closed-tickets").removeClass("active") if $(".closed-tickets").hasClass("active")

  @set_to_closed: ()->
    console.log "set status to open"
    $(".closed-tickets").addClass("active") if not $(".closed-tickets").hasClass("active")
    $(".open-tickets").removeClass("active") if $(".open-tickets").hasClass("active")