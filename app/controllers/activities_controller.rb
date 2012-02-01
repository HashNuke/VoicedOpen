class ActivitiesController < ApplicationController

  before_filter :authenticate_user!, :only => [:destroy, :create, :update]
  load_and_authorize_resource
  respond_to :json
  
  def index
    @activities = Activity.includes(:actable).where :ticket_id => params[:ticket_id]
    respond_with @activities, :include => :actable
  end

  def create
    @activity =  operating_user.activities.build params[:activity]

    if @activity.save
      respond_to do |format|
        format.json { render :json => @activity }
      end
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
        format.json { render :json => nil, :status => :ok }
      end
    else
      respond_to do |format|
        format.json do
          render :json => nil, :status => :unprocessable_entity
        end
      end
    end
  end
  
end
