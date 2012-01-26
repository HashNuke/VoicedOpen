class TicketsController < ApplicationController
  respond_to :json
  
  def index
    @tickets = Ticket.all
    respond_to do |format|
      format.html
      format.json { render :json => @tickets }
  end

  def show
    @ticket = Ticket.find params[:id]
    respond_with @ticket
  end

  def create
    @ticket = Ticket.new params[:ticket]

    if @ticket.save
      respond_with @ticket
    else
      respond_to do |format|
        format.json { render :json => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @ticket = Ticket.find params[:id]

    if @ticket.update_attributes(params[:ticket])
      respond_with @ticket
    else
      respond_to do |format|
        format.json { render :json => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @ticket = Ticket.find params[:id]

    if @ticket.destroy
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json { render :status => :unprocessable_entity }
      end
    end
  end
  
end