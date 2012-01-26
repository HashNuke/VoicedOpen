class ActivitiesController < ApplicationController

  respond_to :json
  
  def index
    @activities = Activity.where :ticket_id => params[:ticket_id]
    respond_with @activities
  end

  def create
    @activity = Activity.new params[:activity]
    if @activity.save
      respond_with @activity
    else
      respond_to do |format|
        format.json do
          render :json => @activity.errors, :status => :unprocessable_entity
        end
      end
    end
  end

  def update
    @activity = Activity.find params[:id]
    if @activity.update_attributes params[:activity]
      respond_with @activity
    else
      respond_to do |format|
        format.json do
          render :json => @activity.errors, :status => :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @activity = Activity.find(params[:id])

    if @activity.destroy
      respond_to do |format|
        format.json { head :ok }
      end
    else
      respond_to do |format|
        format.json do
          render :status => :unprocessable_entity
        end
      end
    end
  end
  
end
