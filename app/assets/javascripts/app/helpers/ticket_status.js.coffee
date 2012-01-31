class App.Helpers.TicketStatus
  @set_to_closed: ()->
    $(".status")
      .removeClass("open")
      .addClass("closed")
      .text("closed")


  @set_to_open: ()->
    $(".status")
      .removeClass("closed")
      .addClass("open")
      .text("open")