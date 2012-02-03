describe "App.Models.Ticket", ->
  it "should have urlRoot as /tickets", ->
    ticket = new App.Models.Ticket()
    expect(ticket.urlRoot).toEqual("/tickets")
