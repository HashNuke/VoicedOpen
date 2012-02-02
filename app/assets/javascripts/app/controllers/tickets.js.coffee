class App.Controllers.Tickets

  @open_tickets: (view_handler, page)->
    App.Helpers.TicketListStatus.set_to_open()
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "open", page: page}),
      success: ()->
        ticket_list = new App.Views.TicketList({collection: tickets})
        view_handler.show_view ticket_list
    })


  @closed_tickets: (view_handler, page)->
    App.Helpers.TicketListStatus.set_to_closed()
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "closed", page: page}),
      success: ()->
        ticket_list = new App.Views.TicketList({collection: tickets, page: page})
        view_handler.show_view ticket_list
    })


  @show_ticket: (view_handler, ticket_id)->
    ticket = new App.Models.Ticket id: ticket_id
    ticket.fetch({
      success: ()->
        ticket_view = new App.Views.Ticket({model: ticket})
        view_handler.show_view ticket_view

      error: ()->
        console.log "ticket wasn't found"
    })


  @search_tickets: (view_handler, term)->
    console.log "search tickets for #{term}"

  @new_ticket: (view_handler)->
    ticket = new App.Models.Ticket()
    new_ticket_view = new App.Views.NewTicket({model: ticket})
    view_handler.show_view new_ticket_view
