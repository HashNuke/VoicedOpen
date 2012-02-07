class App.Controllers.Tickets

  @open_tickets: (view_handler, page)->
    App.Helpers.TicketListStatus.set_to_open()
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "open", page: page}),
      success: ()->
        ticket_list = new App.Views.TicketList({collection: tickets, ticket_status: "open"})
        view_handler.show_view ticket_list
    })


  @closed_tickets: (view_handler, page)->
    App.Helpers.TicketListStatus.set_to_closed()
    tickets = new App.Collections.Tickets()
    tickets.fetch({
      data: $.param({status: "closed", page: page}),
      success: ()->
        ticket_list = new App.Views.TicketList({collection: tickets, page: page, ticket_status: "closed"})
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


  @search_tickets: (view_handler, term, page)->
    tickets = new App.Collections.Tickets({search: true})
    tickets.fetch({
      data: $.param({term: term}),
      success: ()->
        ticket_list = new App.Views.SearchList({collection: tickets, term: term, page: page})
        view_handler.show_view ticket_list
    })


  @new_ticket: (view_handler)->
    ticket = new App.Models.Ticket()
    new_ticket_view = new App.Views.NewTicket({model: ticket})
    view_handler.show_view new_ticket_view
