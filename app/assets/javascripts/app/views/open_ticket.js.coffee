class App.Views.OpenTicket extends Backbone.View
  tag      : "div"
  className: "open-ticket"

  initialize: ()->
    _.bindAll(@, "render")
    @template = _.template App.Templates.OpenTicket

  render: ()->
    $(@el).html @template(@model.toJSON())
    @