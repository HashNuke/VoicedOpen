class App.Views.TicketList extends Backbone.View
  tag      : "div"
  className: "ticket-list"

  initialize: (options)->
    _.bindAll(@, "render")
    @page = options.page
    @ticket_status = options.ticket_status
    @open_ticket_template   = _.template App.Templates.OpenTicket
    @closed_ticket_template = _.template App.Templates.ClosedTicket


  render: ()->
    $ticket_list = $(@el)
    $ticket_list.empty()

    @collection.each (ticket)=>
      ticket_view = null;
      if ticket.get("status") == "closed"
        ticket_view = @closed_ticket_template({
          id        : ticket.get("id")
          title     : ticket.get("title"),
          user_name : "#{ticket.get('ticketable').first_name} #{ticket.get('ticketable').last_name}",
          posted_at : jQuery.timeago(ticket.get("created_at"))
        })
      else
        ticket_view = @open_ticket_template({
          id        : ticket.get("id")
          title     : ticket.get("title"),
          user_name : "#{ticket.get('ticketable').first_name} #{ticket.get('ticketable').last_name}",
          posted_at : jQuery.timeago(ticket.get("created_at"))
        })

      $ticket_list.append(ticket_view)


    current_page = @collection.current_page
    total_pages  = @collection.total_pages()

    ticket_list_nav = $("<div class='ticket-list-nav'></div>")

    if current_page!=1
      ticket_list_nav.append "<a href='#tickets/#{@ticket_status}/#{current_page-1}'>prev</a>"
    if current_page!=total_pages
      ticket_list_nav.append "<a href='#tickets/#{@ticket_status}/#{current_page+1}'>next</a>"


    $ticket_list.append(ticket_list_nav)
    @