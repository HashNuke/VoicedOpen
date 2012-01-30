class App.Views.NewTicket extends Backbone.View
  tag: "div"
  className: "new-ticket"

  events:
    "click .submit": "submit"

  initialize: ()->
    _.bindAll(@, "render")
    @template = _.template App.Templates.NewTicket
    console.log "new ticket view"

  render: ()->
    $(@el).html @template(@model.toJSON())
    @

  submit: ()->
    console.log "submitting the form"
    $.post('/tickets', {
      'ticket[title]'  : $('.ticket_title').val(),
      'ticket[message]': $('.ticket_message').val()
    }, @post_success_callback)

  post_success_callback: ()->
    window.router.navigate("tickets/open", true)