class App.Controllers.Tickets

  @open_tickets: (view_handler)->
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "open"}),
      success: ()->
        ticket_list = new App.Views.TicketList({collection: tickets})
        view_handler.show_view ticket_list
    })


  @closed_tickets: (view_handler)->
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "closed"}),
      success: ()->
        ticket_list = new App.Views.TicketList({collection: tickets})
        view_handler.show_view ticket_list
    })


  @search_tickets: (view_handler, term)->
    console.log "search tickets for #{term}"