require "spec_helper"

describe TicketsController do

  before :each do
    @ticket = Factory :ticket
  end

  
  describe "GET 'index'" do
    it "should assign all the tickets to @tickets" do
      tickets = Ticket.all
      get 'index', :format => :json

      assigns(:tickets).should eq(tickets)
    end
  end


  describe "GET 'show'" do
    it "should assign the ticket to @ticket" do
      get 'show', :id => @ticket.id, :format => :json

      assigns(:ticket).should eq(@ticket)
    end
  end


  describe "POST 'create'" do
    it "should create when POSTed with the right attributes" do
      pending
    end
  end


  describe "POST 'update'" do
    before :each do
      @updated_attributes = {
        "title" => "A new title"
      }
    end
    
    it "should update the Ticket with the new attribute values" do
      Ticket.should_receive(:find)
        .with(@ticket.id.to_s)
        .and_return(@ticket)

      @ticket.should_receive(:update_attributes).
        with(@updated_attributes)

      post(
        'update',
        :id =>@ticket.id.to_s,
        :ticket => @updated_attributes)
    end


    it "should return Ticket if updated attributes are saved" do
      post(
        'update',
        :id =>@ticket.id.to_s,
        :ticket => @updated_attributes)

      assigns(:ticket).should eq(Ticket.find @ticket.id)
    end
  end


  describe "DELETE 'destroy'" do
    it "should destroy the Ticket" do
      Ticket.should_receive(:find).
        and_return(@ticket)

      @ticket.should_receive :destroy

      delete 'destroy', :id => @ticket.id
    end
  end

end
