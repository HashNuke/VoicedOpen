class App.Views.SearchList extends Backbone.View
  tag      : "div"
  className: "ticket-list"

  initialize: (options)->
    _.bindAll(@, "render")
    @page = options.page
    @term = options.term

  render: ()->
    $(@el).empty()

    @collection.each (ticket)=>
      ticket_view = new App.Views.TicketListItem({model: ticket})
      $(@el).append(ticket_view.render().el)

    $(@el).append("<h2>No tickets found</h2>") if @collection.pluck("title").length == 0

    ticket_list_nav = new App.Views.TicketListNav({collection: @collection, search_term: @term})
    $(@el).append(ticket_list_nav.render().el)
    @