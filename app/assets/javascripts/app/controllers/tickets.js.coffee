class App.Controllers.Tickets

  @open_tickets: ()->
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "open"}),
      success: ()->
        ticket_list = new App.Views.TicketList({collection: tickets})
        $(".container").html ticket_list.render().el
    })


  @closed_tickets: ()->
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "closed"})
    })


  @search_tickets: (term)->
    console.log "search tickets for #{term}"