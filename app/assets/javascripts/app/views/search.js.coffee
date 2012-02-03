class App.Views.Search extends Backbone.View
  className: "search"
  tag      : "div"

  initialize: ()->
    _.bindAll(@, "render")
    @template = _.template App.Templates.Search
    console.log "initialized search"

  render: ()->
    $(@el).html(@template({}))
    @

  events:
    "keypress .search-keyword": "perform_search"

  perform_search: (e)->
    search_term = $(@el).find(".search-keyword").val()
    if e.keyCode == 13 and search_term.length >3
      window.router.navigate "tickets/search/#{search_term}", true