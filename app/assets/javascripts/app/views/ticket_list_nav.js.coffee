class App.Views.TicketListNav extends Backbone.View

  tag: "div"
  className: "ticket-list-nav"

  initialize: (options)->
    @collection = options.collection
    @nav_term   = options.ticket_status if options.ticket_status
    @nav_term   = "search/#{options.search_term}" if options.search_term
    console.log "initialized ticket list nav"


  render: ()->
    current_page = @collection.current_page
    total_pages  = @collection.total_pages()

    if current_page > 1
      $(@el).append "<a href='#tickets/#{@nav_term}/#{current_page-1}'>prev</a>"

    if current_page > 0 && current_page!=total_pages
      $(@el).append "<a href='#tickets/#{@nav_term}/#{current_page+1}'>next</a>"

    @