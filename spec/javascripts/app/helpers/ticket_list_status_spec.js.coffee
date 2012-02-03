describe "App.Helpers.TicketListStatus", ->

  describe "@set to open", ->
    it "should set ticket list status to open", ->
      $ = sinon.stub()
      addClassObject = sinon.stub()
      hasClassObject = sinon.stub()

      $.withArgs(".open-tickets")
        .returns(hasClassObject)

      hasClassObject.withArgs("active")
        .returns(true)

      $.withArgs(".closed-tickets")
        .returns(hasClassObject)

      hasClassObject.withArgs("active")
        .returns(true)

      $.withArgs(".open-tickets")
        .returns(addClassObject)

      App.Helpers.TicketListStatus()