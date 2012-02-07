class App.Views.TicketList extends Backbone.View
  tag      : "div"
  className: "ticket-list"

  initialize: (options)->
    _.bindAll(@, "render")
    @page = options.page
    @ticket_status = options.ticket_status if options.ticket_status

  render: ()->
    $(@el).empty()

    @collection.each (ticket)=>
      ticket_view = new App.Views.TicketListItem({model: ticket})
      $(@el).append(ticket_view.render().el)

    $(@el).append("<h2>No tickets found</h2>") if @collection.pluck("title").length == 0

    ticket_list_nav = new App.Views.TicketListNav({collection: @collection, ticket_status: @ticket_status})
    $(@el).append(ticket_list_nav.render().el)
    @