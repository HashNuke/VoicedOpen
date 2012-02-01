class TicketsController < ApplicationController

  before_filter :authenticate_user!, :only => [:destroy, :create, :update]
  load_and_authorize_resource  
  respond_to :json
  
  
  def index
    @tickets = Ticket.includes(:ticketable).where(:status => params[:status]) if params[:status] == "closed" or params[:status] == "open"

    @tickets ||= Ticket.all
    respond_with @tickets, :include => :ticketable
  end

  def show
    @ticket = Ticket.includes(:ticketable).find params[:id]
    respond_with @ticket, :include => :ticketable
  end

  def create
    @ticket = operating_user.tickets.build params[:ticket]

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

    old_status = @ticket.status

    if @ticket.update_attributes(params[:ticket])
      @ticket.log_status_activity_by(operating_user) if not @ticket.status==old_status
      respond_with @ticket
    else
      respond_to do |format|
        format.json do
          render :json => @ticket.errors, :status => :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @ticket = Ticket.find params[:id]

    if @ticket.destroy
      respond_to do |format|
        format.json { render :json => nil, :status => :ok }
      end
    else
      respond_to do |format|
        format.json { render :json => nil, :status => :unprocessable_entity }
      end
    end
  end

  private

  def operating_user
    current_user || current_admin
  end
end
