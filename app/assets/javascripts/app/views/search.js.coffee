class App.Views.Search extends Backbone.View
  className: "search"
  tag      : "div"

  initialize: ()->
    _.bindAll(@, "render")
    @template = _.template App.Templates.Search
    console.log "initialized search"

  render: ()->
    $(@el).html(@template())
    @

  events:
    "click .search": "perform_search"

  perform_search: (e)->
    console.log("akash")