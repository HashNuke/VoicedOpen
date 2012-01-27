App.start = ()->
  App.Controllers.Tickets.open_tickets()

$ ->
  App.start()