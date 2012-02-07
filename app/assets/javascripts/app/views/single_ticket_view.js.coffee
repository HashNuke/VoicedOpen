class App.Views.TicketListItem extends Backbone.View

  tag: "div"
  className: "ticket-item"


  initialize: ()->
    console.log "initialize ticket list item view"
    @template = _.template App.Templates.TicketListItem


  render: ()->

    $(@el).html @template({
      id        : @model.get("id")
      title     : @model.get("title"),
      user_name : "#{@model.get('ticketable').first_name} #{@model.get('ticketable').last_name}",
      posted_at : jQuery.timeago(@model.get("created_at"))
    })
    @