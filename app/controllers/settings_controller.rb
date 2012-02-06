class SettingsController < ApplicationController

  before_filter :authenticate_admin!, :except => [:show]
  respond_to :json
  
  def index
    @setting = Setting.find_by_slug "sidebar_description"
    respond_with @setting
  end

  def show
    setting = Setting.find(params[:id])
    respond_with setting
  end
  
  def update
    setting = Setting.find(params[:id])

    if setting.update_attributes(params[:setting])
      respond_with setting
    else
      respond_to do |format|
        format.json do
          render :json => setting.errors, :status => :unprocessable_entity
        end
      end
    end
  end

end

